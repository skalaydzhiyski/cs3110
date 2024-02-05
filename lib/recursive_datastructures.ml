(** Recursive and Parameterised Variants *)

(* std implementation of a list *)
type 'a mylist =
  | Nil
  | Cons of 'a * 'a mylist

let rec length = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t

type 'a btree =
  | Leaf
  | Node of 'a * 'a btree * 'a btree

let example_tree =
  Node (1, Node (2, Node (3, Leaf, Leaf), Node (4, Leaf, Leaf)), Node (5, Leaf, Leaf))

let rec preorder_dfs = function
  | Leaf -> print_endline "leaf"
  | Node (v, left, right) ->
    print_endline @@ Int.to_string v;
    preorder_dfs left;
    preorder_dfs right

let rec preorder_dfs_lst = function
  | Leaf -> []
  | Node (v, l, r) -> [ v ] @ preorder_dfs_lst l @ preorder_dfs_lst r

let rec map_tree f = function
  | Leaf -> Leaf
  | Node (v, l, r) -> Node (f v, map_tree f l, map_tree f r)

let rec tree_fold f acc = function
  | Leaf -> acc
  | Node (v, l, r) -> f v (tree_fold f acc l) (tree_fold f acc r)
