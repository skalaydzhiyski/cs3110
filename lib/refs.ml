(* make things easier *)
let ( += ) x v = x := !x + v
let ( -= ) x v = x := !x - v
let ( *= ) x v = x := !x * v
let ( /= ) x v = x := !x / v
let test_ref = ref 128

let test () =
  let x = ref 128 in
  x += 128;
  let res = !x * 2 in
  Format.sprintf "res = %d" res
