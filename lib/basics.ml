let number = 1280

let rec frec x =
  let inner = 128 in
  if x < 2 then 2 else inner + frec (x - 1)

let rec fact x = if x <= 2 then 2 else x * fact (x - 1)

(* matching *)
type person =
  { name : string
  ; password : int
  }

let match_record r =
  match r with
  | { name = "darchitect"; _ } -> "you're in!"
  | { name; password } -> Int.to_string password ^ name

let match_tuple t =
  match t with
  | 1, 2 -> 2
  | a, _ -> a

let match_sugar = function
  | "" -> 128
  | "something" -> 129
  | _ -> 666

let rec len = function
  | [] -> 0
  | _ :: t -> 1 + len t

let rec rotate lst = function
  | 0 -> lst
  | k -> rotate List.(tl lst @ [ hd lst ]) (k - 1)

(* variants *)

type color =
  | Red
  | Green
  | Blue

type point = float * float

type shape =
  | Circle of
      { center : point
      ; radius : float
      }
  | Rectangle of
      { lower_left : point
      ; upper_right : point
      }
  | Point of point

let get_center = function
  | Circle { center; _ } -> center
  | Rectangle { lower_left = xll, yll; upper_right = xur, yur } ->
    let avg l r = (l +. r) /. 2. in
    avg xll xur, avg yll yur
  | Point p -> p

type address =
  { name : string
  ; address : string
  ; years_lived : int
  }

type web_address =
  { name : string
  ; address : string
  ; years_hosted : int
  }

type address_book =
  | PhysicalAddressBook of address list
  | WebAddressBook of web_address list

let get_name_from_address_book = function
  | PhysicalAddressBook ab ->
    (match ab with
     | [] -> failwith "error!"
     | { name; _ } :: _ -> name)
  | WebAddressBook ab ->
    (match ab with
     | [] -> failwith "error!"
     | { name; _ } :: _ -> name)

let get_name_from_address_book2 abook =
  let first_or_fail l = if List.is_empty l then failwith "error!" else List.nth l 0 in
  match abook with
  | PhysicalAddressBook ab -> (first_or_fail ab).name
  | WebAddressBook ab -> (first_or_fail ab).name

let ab =
  PhysicalAddressBook
    [ { name = "gosho"; address = "10 dorey house"; years_lived = 3 }
    ; { name = "mitko"; address = "357 bolo lane"; years_lived = 2 }
    ]
