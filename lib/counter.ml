let counter = ref 0

let count () =
  print_endline @@ Int.to_string !counter;
  (* counter := !counter + 1; *)
  incr counter;
  print_endline @@ Int.to_string !counter

let cleaner_count =
  let counter = ref 0 in
  fun () ->
    incr counter;
    !counter
