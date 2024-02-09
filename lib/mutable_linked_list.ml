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

let rec insert_end v n =
  match n.next with
  | None ->
    let n' = make_node v in
    n.next <- Some n'
  | Some next -> insert_end v next
