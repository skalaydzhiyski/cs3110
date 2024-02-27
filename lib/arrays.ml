(* TODO: continue here when you're coming back to the OCaml course *)
type vector = int array

let v : vector = [| 1; 2; 3; 4; 5 |]

(* iterative *)
let vector_print v =
  for i = 0 to Array.length v - 1 do
    print_endline @@ Int.to_string v.(i)
  done

let vector_add v1 v2 =
  let len1, len2 = Array.length v1, Array.length v2 in
  if len1 <> len2
  then failwith "different lengths|"
  else (
    let res = Array.make len1 0 in
    for i = 0 to len1 - 1 do
      res.(i) <- v1.(i) + v2.(i)
    done;
    res)

(* functional *)
let vector_print' = Array.iter (Printf.printf "%d ")
let vector_add' v1 v2 = Array.map2 ( + ) v1 v2
