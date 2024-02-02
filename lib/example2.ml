(** Recursive and Parameterised Variants *)

(* std implementation of a list *)
type 'a mylist =
  | Nil
  | Cons of 'a * 'a mylist

let rec length = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t

type 'a btree =
  | Leaf of 'a
  | Node of 'a * 'a btree * 'a btree

let example_tree = Node (1, Node (2, Leaf 3, Leaf 4), Leaf 5)

let rec preorder_dfs = function
  | Leaf v -> print_endline @@ Int.to_string v
  | Node (v, left, right) ->
    print_endline @@ Int.to_string v;
    preorder_dfs left;
    preorder_dfs right

let rec preorder_dfs_lst = function
  | Leaf v -> [ v ]
  | Node (v, l, r) -> [ v ] @ preorder_dfs_lst l @ preorder_dfs_lst r
