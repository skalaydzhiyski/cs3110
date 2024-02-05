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

let example_stack = TStack.Node (1, Node (2, Node (3, Empty)))
