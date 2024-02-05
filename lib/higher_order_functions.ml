let double x = x * 2
let quad x = x |> double |> double

let rec apply_ntimes f x = function
  | 0 -> x
  | n -> f @@ apply_ntimes f x (n - 1)

let rec map f = function
  | [] -> []
  | h :: t -> f h :: map f t

(* folding left is tail recursive, if you need to fold right -> reverse list and fold left *)
let rec fold_left f acc lst =
  match lst with
  | [] -> acc
  | h :: t -> fold_left f (f acc h) t

let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | h :: t -> f h (fold_right f t acc)

let rec filter p = function
  | [] -> []
  | h :: t -> if p h then h :: filter p t else filter p t

let rec filter_aux p acc = function
  | [] -> acc
  | h :: t -> if p h then h :: filter_aux p acc t else filter_aux p acc t
