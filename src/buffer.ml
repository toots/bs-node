type t

external length : t -> float = "length" [@@bs.get]

external toString : t -> string -> float -> float -> string = "toString" [@@bs.send]
let toString ?(encoding="utf8") ?(start=0.) ?stop buffer =
  let stop =
    match stop with
      | Some s -> s
      | None -> length buffer -. start
  in
  toString buffer encoding start stop

type buffer_class
external buffer_class : buffer_class = "Buffer" [@@bs.val]
external alloc : buffer_class -> float -> t = "alloc" [@@bs.send]
let alloc = alloc buffer_class

external concat : buffer_class -> t array -> t = "concat" [@@bs.send]
let concat = concat buffer_class

external from : buffer_class -> string -> string Js.Nullable.t -> t = "from" [@@bs.send]
let from ?encoding data =
  from buffer_class data (Js.Nullable.fromOption encoding)

let get : t -> float -> int = [%raw fun buf idx ->
  "return buf[idx];"
]

let set : t -> float -> int -> unit = [%raw fun buf idx el ->
  "buf[idx] = el;"
]
