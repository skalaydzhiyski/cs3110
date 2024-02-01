module E1 = Cs3110.Example1

let () =
  print_endline "Running below examples to demo OCaml's capabilities...";
  print_endline @@ Int.to_string E1.number;
  print_endline @@ Int.to_string (E1.frec 10);
  print_endline @@ Int.to_string (E1.fact 10)
