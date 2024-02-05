(* TODO: continue here when you're coming back to 3110 *)

module type Interface = sig
  type t

  val create : unit -> t
  val f : t -> string
end

module MyIntImpl : Interface = struct
  type t = int

  let create () = 128
  let f x = "<" ^ Int.to_string x ^ ">"
end

module MyStringImpl : Interface = struct
  type t = string

  let create () = "something"
  let f s = "<" ^ s ^ ">"
end

module MyInt : Interface = MyIntImpl
module MyString : Interface = MyStringImpl

let int1 = MyInt.create ()
let string1 = MyString.create ()
let intres = MyInt.(create () |> f)
let stringres = MyString.(create () |> f)
