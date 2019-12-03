type t = {
  hash:     string;
  host:     string;
  hostname: string;
  href:     string;
  origin:   string;
  password: string;
  pathname: string;
  port:     int;
  protocol: string;
  search:   string;
  username: string
}

external parse : string -> t = "parse" [@@bs.module "url"]
external toString: t -> string = "toString" [@@bs.send]
external toJson: t -> string = "toJson" [@@bs.send]
