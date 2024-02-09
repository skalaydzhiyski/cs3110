type point =
  { x : int
  ; y : int
  ; mutable title : string
  }

let to_string p = Int.(to_string p.x ^ "," ^ to_string p.y) ^ "," ^ p.title

let test () =
  let p = { x = 1; y = 2; title = "something" } in
  print_endline @@ to_string p;
  p.title <- "something else";
  print_endline @@ to_string p
