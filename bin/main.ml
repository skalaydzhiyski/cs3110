module T1 = Cs3110.Basics
module T2 = Cs3110.Recursive_datastructures
module T3 = Cs3110.Higher_order_functions
module T4 = Cs3110.Modules_basic

(* NOTE: most testing can be done by just loading the lib modules in utop *)

let () =
  print_endline "Run examples from the lectures..";
  let examples =
    [ Int.to_string T1.number
    ; Int.to_string @@ T1.frec 10
    ; Int.to_string @@ T1.fact 10
    ; Int.to_string @@ T1.len [ 1; 2; 3; 4; 5 ]
    ; T1.get_name_from_address_book T1.ab
    ; T2.preorder_dfs_lst T2.example_tree
      |> List.map Int.to_string
      |> List.fold_left ( ^ ) ""
    ; T2.example_tree
      |> T2.map_tree (( + ) 1)
      |> T2.preorder_dfs_lst
      |> List.map Int.to_string
      |> List.fold_left ( ^ ) ""
    ; T4.TStack.to_list T4.example_stack
      |> List.map Int.to_string
      |> List.fold_left ( ^ ) ""
    ; T4.TStack.to_list @@ T4.TStack.push 4 T4.example_stack
      |> List.map Int.to_string
      |> List.fold_left ( ^ ) ""
      (* TODO: add more examples here *)
    ]
  in
  List.iter print_endline examples
