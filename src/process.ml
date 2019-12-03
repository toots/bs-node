type event = [
  | `UncaughtException of exn -> unit
  | `SIGINT   of unit -> unit
  | `SIGTERM  of unit -> unit
  | `SIGUSR1  of unit -> unit
  | `SIGPIPE  of unit -> unit
  | `SIGHUP   of unit -> unit
  | `SIGBREAK of unit -> unit
  | `SIGWINCH of unit -> unit
  | `SIGSTOP  of unit -> unit
  | `SIGBUS   of unit -> unit
  | `SIGFPE   of unit -> unit
  | `SIGSEV   of unit -> unit
]

external on : string -> ('a -> unit) -> unit = "on" [@@bs.val] [@@bs.scope "process"]

let on = function
  | `UncaughtException fn -> on "uncaughtException" fn
  | `SIGINT fn   -> on "SIGINT" fn
  | `SIGTERM fn  -> on "SIGTERM" fn
  | `SIGUSR1 fn  -> on "SIGUSR1" fn
  | `SIGPIPE fn  -> on "SIGPIPE" fn
  | `SIGHUP fn   -> on "SIGHUP" fn
  | `SIGBREAK fn -> on "SIGBREAK" fn
  | `SIGWINCH fn -> on "SIGWINCH" fn
  | `SIGSTOP fn  -> on "SIGSTOP" fn
  | `SIGBUS fn   -> on "SIGBUS" fn
  | `SIGFPE fn   -> on "SIGFPE" fn
  | `SIGSEV fn   -> on "SIGSEV" fn

external argv : string array = "argv" [@@bs.val] [@@bs.scope "process"]

external exit : int -> 'a = "exit" [@@bs.val] [@@bs.scope "process"]

external stdin : Stream.readable = "stdin" [@@bs.val] [@@bs.scope "process"]
external stderr : Stream.writable = "stderr" [@@bs.val] [@@bs.scope "process"]
external stdout : Stream.writable = "stdout" [@@bs.val] [@@bs.scope "process"]
