external dirname : string -> string = "dirname" [@@bs.module "path"]
external extname : string -> string = "extname" [@@bs.module "path"]
external normalize : string -> string = "normalize" [@@bs.module "path"]
external resolve : string array -> string = "resolve" [@@bs.module "path"] [@@bs.splice]
