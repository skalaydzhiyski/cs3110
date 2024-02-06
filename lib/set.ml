module type Set = sig
  (** ['a t] is the type of a set with elements of type ['a]*)
  type 'a t

  (** [empty] is the empty set *)
  val empty : 'a t

  (** [size s] returns the size of the set [s]
      [size empty] is [0] *)
  val size : 'a t -> int

  (** [mem x s] is [true] iff [x] is a member of [s] *)
  val mem : 'a -> 'a t -> bool

  (** [map] maps a function [f] to all the elements of [s] *)
  val map : ('a -> 'b) -> 'a t -> 'b t

  (** [add x s] is a set containing all the elements of [s]
      as well as element [x] *)
  val add : 'a -> 'a t -> 'a t

  (** [string s] gives back the string representation of the set [s]
      using [f] to represent a single element as a string *)
  val string : f:('a -> string) -> 'a t -> string
end

module ListSet : Set = struct
  type 'a t = 'a list

  let empty = []
  let size = List.length
  let mem = List.mem
  let map = List.map
  let add x s = if mem x s then s else x :: s
  let string ~f s = Format.sprintf "{%s}" @@ String.concat ", " @@ map f s
end

let test () =
  let open ListSet in
  let s = empty |> add 1 |> add 2 |> add 2 |> add 3 in
  let sz = size s in
  print_endline @@ string ~f:Int.to_string s;
  print_endline @@ Int.to_string sz
