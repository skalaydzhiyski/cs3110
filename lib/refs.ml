(* make things easier *)
let ( += ) x v = x := !x + v
let ( -= ) x v = x := !x - v
let ( *= ) x v = x := !x * v
let ( /= ) x v = x := !x / v
let test_ref = ref 128

let test () =
  let x = ref 128 in
  x += 128;
  print_endline @@ Format.sprintf "x = %d" !x;
  print_endline "make alias";
  let y = x in
  print_endline "update alias";
  (* this modifies the underlying reference contents *)
  y := 1;
  print_endline @@ Format.sprintf "x = %d ; y = %d" !x !y;
  print_endline @@ Format.sprintf "x = y = %b" (x = y);
  print_endline @@ Format.sprintf "x == y = %b" (x == y);
  print_endline @@ Format.sprintf "x <> y = %b" (x <> y);
  print_endline @@ Format.sprintf "x != y = %b" (x != y)
