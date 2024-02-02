module E1 = Cs3110.Example1

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
    ]
  in
  List.iter print_endline examples
