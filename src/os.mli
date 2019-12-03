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

val cpus     : unit -> cpu array
val hostname : unit -> string
val platform : unit -> string
