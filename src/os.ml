type times = {
  user: int;
  nice: int;
  sys:  int;
  idle: int;
  irq:  int
}

type cpu = {
  model: string;
  speed: int;
  times: times
}

external cpus : unit -> cpu array = "cpus" [@@bs.module "os"]
external platform : unit -> string = "platform" [@@bs.module "os"]
external hostname : unit -> string = "hostname" [@@bs.module "os"]
