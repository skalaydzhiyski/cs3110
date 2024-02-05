module type S = sig
  val y : int
end

module Foo = struct
  let x = 128
end

module SIOpen = struct
  open Foo

  let y = x
end

module SIInclude = struct
  include Foo

  let y = x
end
