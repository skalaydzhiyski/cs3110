(** Composition is not implemented by default in OCaml with the (.) operator
    we'll have to implement our own operator .. *)
let ( << ) f g x = f @@ g x

let f x =
  print_string "f -> ";
  x + 1

let f' x =
  print_string "f' ";
  x + 1

let g x =
  print_string "g -> ";
  x + 1

let g' x =
  print_string "g' -> ";
  x + 1

let fcomp = f' << g' << f << g
let res = fcomp 128
