module type Map = sig
  (** [t] is the type of map that binds values of type [a] to values of type [b] *)
  type ('a, 'b) t

  (** [empty] returns an empty map *)
  val empty : unit -> ('k, 'v) t

  (** [of_list lst] returns a map with one entry for pair in the list.
      If in [lst] we get duplicate keys we throw an exception *)
  val of_list : ('k * 'v) list -> ('k, 'v) t

  (** [to_list m] returns an association list of the pairs
      for all the bindings in [m] *)
  val to_list : ('k, 'v) t -> ('k * 'v) list

  (** [insert k v m] is the same map as [m] + the additional binding
      from [k] to [v]. If [k] is already there - we replace it with [v] *)
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t

  (** [find k m] returns an optional value [v] if found *)
  val find : 'k -> ('k, 'v) t -> 'v option

  (** [remove k m] returns a new map with the entry for key [k] removed *)
  val remove : 'k -> ('k, 'v) t -> ('k, 'v) t
end

module ListMap : Map = struct
  (** AF: [(k1, v1); (k2, v2); ...; (kn, vn)]
          -> {k1: v1, k2: v2, ..., kn: vn}.
      In the case of duplicates [[(k, v1); (k, v2)]]
      turns into the map {k: v1}!
  *)
  type ('k, 'v) t = ('k * 'v) list

  let _binding m k = k, List.assoc k m
  let _keys m = m |> List.map fst |> List.sort_uniq Stdlib.compare
  let empty () = []
  let insert k v m = (k, v) :: m
  let find = List.assoc_opt
  let to_list m = List.map (_binding m) (_keys m)
  let of_list lst = lst
  let remove = List.remove_assoc
end

let test () =
  let open ListMap in
  let print m = to_list m |> List.iter (fun (l, r) -> Printf.printf "(%d, %d); " l r) in
  print_endline "empty, insert";
  let m = empty () |> insert 1 2 |> insert 2 3 |> insert 3 4 in
  print m;
  print_endline "\nof_list";
  let m = of_list [ 1, 2; 2, 3 ] in
  print m;
  print_endline "\nfind";
  (match find 1 m with
   | None -> print_endline "not found"
   | Some x -> Printf.printf "%d" x);
  print_endline "\nremove 1";
  let res = remove 1 m in
  print res
