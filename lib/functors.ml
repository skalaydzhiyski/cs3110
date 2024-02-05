module type X = sig
  val x : int
  val modify : int -> int
  val to_overwrite : int -> int
end

module A : X = struct
  let x = 128
  let modify x = x + 1
  let to_overwrite x = x
end

module A' (M : X) = struct
  let x = M.x + 1
  let modify x = x |> M.modify |> M.modify |> ( * ) 2
  let to_overwrite x y z = x + y + z
end

module B = A' (A)

let res = B.(modify x)
