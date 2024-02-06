type lang =
  | OCaml
  | SML
  | Lisp
  | Lambda

let lang_to_int = function
  | OCaml -> 1
  | SML -> 2
  | Lisp -> 3
  | Lambda -> 4

module Lang = struct
  type t = lang

  let compare l r = lang_to_int l - lang_to_int r
end

module LangMap = Map.Make (Lang)

let test () =
  let open LangMap in
  let m =
    empty
    |> add OCaml "luke"
    |> add SML "vader"
    |> add Lisp "the emperor"
    |> add Lambda "the dark side"
  in
  List.iter (fun p -> snd p |> print_endline) @@ to_list m;
  print_endline @@ Format.sprintf "result of find: %s" (find OCaml m)
