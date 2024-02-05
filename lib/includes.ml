module type Ring = sig
  type t

  val zero : t
  val one : t
  val ( + ) : t -> t -> t
  val ( * ) : t -> t -> t
  val ( - ) : t -> t -> t
  val ( ~- ) : t -> t
  val string : t -> string
end

module IntRingImpl = struct
  type t = int

  let zero = 0
  let one = 1
  let ( + ) = Stdlib.( + )
  let ( * ) = Stdlib.( * )
  let ( - ) = Stdlib.( - )
  let ( ~- ) = Stdlib.( ~- )
  let string = Int.to_string
end

module IntRing : Ring = IntRingImpl

module FloatRingImpl = struct
  type t = float

  let zero = 0.
  let one = 1.
  let ( + ) = Stdlib.( +. )
  let ( * ) = Stdlib.( *. )
  let ( - ) = Stdlib.( -. )
  let ( ~- ) = Stdlib.( ~-. )
  let string = Float.to_string
end

module FloatRing : Ring = FloatRingImpl

module type Field = sig
  include Ring

  val ( / ) : t -> t -> t
end

module IntField : Field = struct
  include IntRingImpl

  let ( / ) = Stdlib.( / )
end

let res = IntField.((one + one) / (one + one) |> string)
