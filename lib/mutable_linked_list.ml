(* Singly-linked List *)

type 'a node =
  { value : 'a
  ; mutable next : 'a node option
  }

let make_node v = { value = v; next = None }

let rec insert_front v current =
  let node = make_node v in
  node.next <- Some current;
  node

let test_list = insert_front 1 @@ insert_front 2 @@ make_node 3

let rec print_list = function
  | None -> print_endline "X"
  | Some head ->
    Printf.printf "%d -> " head.value;
    print_list head.next

let rec insert_end v head =
  match head.next with
  | None ->
    let new_node = make_node v in
    head.next <- Some new_node
  | Some next -> insert_end v next

let print_list_iter head =
  let current = ref head in
  while !current <> None do
    match !current with
    | None -> print_endline "X"
    | Some n ->
      print_endline @@ Int.to_string n.value;
      current := (Option.get !current).next
  done

let insert_end_iter v head =
  let current = ref (Some head) in
  while !current <> None do
    let n = Option.get !current in
    match n.next with
    | None -> n.next <- Some (make_node v)
    | Some n' -> current := n'.next
  done;
  head
