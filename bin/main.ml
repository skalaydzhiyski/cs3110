module E1 = Cs3110.Example1
module E2 = Cs3110.Example2
module E3 = Cs3110.Example3

let ab =
  E1.PhysicalAddressBook
    [ { name = "gosho"; address = "10 dorey house"; years_lived = 3 }
    ; { name = "mitko"; address = "357 bolo lane"; years_lived = 2 }
    ]

let () =
  print_endline "Run examples from the lectures..";
  let examples =
    [ Int.to_string E1.number
    ; Int.to_string @@ E1.frec 10
    ; Int.to_string @@ E1.fact 10
    ; Int.to_string @@ E1.len [ 1; 2; 3; 4; 5 ]
    ; E1.get_name_from_address_book ab
    ; E2.preorder_dfs_lst E2.example_tree
      |> List.map Int.to_string
      |> List.fold_left ( ^ ) ""
    ; E2.example_tree
      |> E2.tree_map (( + ) 1)
      |> E2.preorder_dfs_lst
      |> List.map Int.to_string
      |> List.fold_left ( ^ ) ""
    ]
  in
  List.iter print_endline examples
