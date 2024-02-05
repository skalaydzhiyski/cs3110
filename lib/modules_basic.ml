module TStack = struct
  type 'a stack =
    | Empty
    | Node of 'a * 'a stack

  let empty = Empty

  let is_empty = function
    | Empty -> true
    | _ -> false

  let pop = function
    | Empty -> failwith "the stack is empty!"
    | Node (_, t) -> t

  let peek = function
    | Empty -> failwith "the stack is empty!"
    | Node (h, _) -> h

  let push v s =
    match s with
    | h -> Node (v, h)

  let rec to_list = function
    | Empty -> []
    | Node (h, t) -> h :: to_list t
end

module FastQueue = struct
  (** This is an efficient implementation using Melville style
      Example: {front = [1;2;3], back=[5;4]} -> [1;2;3;4;5]
  *)
  type 'a queue =
    { front : 'a list
    ; back : 'a list
    }

  let empty = { front = []; back = [] }

  let peek = function
    | { front = []; _ } -> None
    | { front = h :: _; _ } -> Some h

  let enqueue x = function
    | { front = []; _ } -> { front = [ x ]; back = [] }
    | q -> { q with back = x :: q.back }

  let dequeue = function
    | { front = []; _ } -> None
    | { front = _ :: []; back } -> Some { front = List.rev back; back = [] }
    | { front = _ :: t; back } -> Some { front = t; back }
end

module ListQueue = struct
  type 'a queue = 'a list

  exception Empty

  let empty = []

  let peek = function
    | [] -> None
    | h :: _ -> Some h

  let enqueue x q = q @ [ x ]

  let dequeue = function
    | [] -> None
    | _ :: q -> Some q
end

(* helpers *)
let ( >>| ) opt f =
  match opt with
  | None -> None
  | Some x -> Some (f x)

let ( >>= ) opt f =
  match opt with
  | None -> None
  | Some x -> f x

let example_stack = TStack.(empty |> push 3 |> push 2 |> push 1)
let example_stack_peek = TStack.(empty |> push 2 |> push 1 |> pop |> peek)
let example_q : int list = ListQueue.(empty |> enqueue 1 |> enqueue 2 |> enqueue 3)
let example_q' : int list option = ListQueue.(empty |> enqueue 1 |> dequeue >>| enqueue 1)

let example_len_q =
  ListQueue.(
    empty |> enqueue 1 |> dequeue >>| enqueue 1 >>= dequeue >>| List.length |> Option.get)
