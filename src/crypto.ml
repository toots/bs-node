type hash
external createHash : string -> hash = "createHash" [@@bs.module "crypto"]
external update : hash -> string -> unit = "update" [@@bs.send]
external digest : hash -> string -> string = "digest" [@@bs.send]
