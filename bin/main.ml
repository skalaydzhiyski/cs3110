module E1 = Cs3110.Example1

let () =
  print_endline "Running below examples...";
  let examples = [
    Int.to_string E1.number;
    Int.to_string (E1.frec 10);
    Int.to_string (E1.fact 10)
  ] in
  List.iter print_endline examples
