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

type point = int * int

type shape =
  | Circle of
      { center : point
      ; radius : float
      }
  | Rectangle of
      { lower_left : point
      ; upper_right : point
      }

let get_center = function
  | Circle { center; _ } -> center
  | Rectangle { lower_left; upper_right } ->
    (* below is meaningless *)
    fst lower_left + fst upper_right, snd lower_left + snd upper_right
