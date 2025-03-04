open BsAsyncMonad.Callback

type stats = private {
  dev:         float;
  ino:         float;
  mode:        float;
  nlink:       float;
  uid:         float;
  gid:         float;
  rdev:        float;
  size:        float;
  blksize:     float;
  blocks:      float;
  atimeMs:     float;
  mtimeMs:     float;
  ctimeMs:     float;
  birthtimeMs: float;
  atime:       Js.Date.t;
  mtime:       Js.Date.t;
  ctime:       Js.Date.t;
  birthtime:   Js.Date.t;
} [@@bs.deriving abstract]

type constants = {
  copyfile_excl: int [@bs.as "COPYFILE_EXCL"];
  copyfile_ficlone : int [@bs.as "COPYFILE_FICLONE"];
  copyfile_ficlone_force : int [@bs.as "COPYFILE_FICLONE_FORCE"];
  f_ok : int [@bs.as "F_OK"];
  r_ok : int [@bs.as "R_OK"];
  w_ok : int [@bs.as "W_OK"];
  x_ok : int [@bs.as "X_OK"]
} [@@bs.deriving abstract]

external constants : constants  = "constants" [@@bs.module "fs"] 

type flag = [
  | `COPYFILE_EXCL
  | `COPYFILE_FICLONE
  | `COPYFILE_FICLONE_FORCE
]

let int_of_flag = function
  | `COPYFILE_EXCL -> copyfile_exclGet constants
  | `COPYFILE_FICLONE -> copyfile_ficloneGet constants
  | `COPYFILE_FICLONE_FORCE -> copyfile_ficlone_forceGet constants

type access = [
  | `F_OK
  | `R_OK
  | `W_OK
  | `X_OK
]

let int_of_access = function
  | `F_OK -> f_okGet constants
  | `R_OK -> r_okGet constants
  | `W_OK -> w_okGet constants
  | `X_OK -> x_okGet constants

type stream_params
external stream_params : ?fd:int -> ?autoClose:bool -> unit -> stream_params = "" [@@bs.obj]

external access : string -> unit callback -> unit = "access" [@@bs.module "fs"]
external accessWithMode : string -> int -> unit callback -> unit = "access" [@@bs.module "fs"]

let access ?(mode=[]) path cb =
  if mode = [] then
    access path cb
  else
    let mode = List.fold_left (fun x y ->
      x lor int_of_access y) 0 mode
    in
    accessWithMode path mode cb

external copyFileSync : string -> string -> int -> unit = "copyFileSync" [@@bs.module "fs"]

let copyFileSync ?(flags=[]) src dst =
  let flag = List.fold_left (fun x y ->
    x lor int_of_flag y) 0 flags
  in
  copyFileSync src dst flag

external createReadStream  : string Js.nullable -> stream_params -> Stream.readable = "createReadStream" [@@bs.module "fs"]
external createWriteStream : string Js.nullable -> stream_params -> Stream.writable = "createWriteStream" [@@bs.module "fs"]
external existsSync : string -> bool = "existsSync" [@@bs.module "fs"]
external unlinkSync : string -> unit = "unlinkSync" [@@bs.module "fs"]
external rmdirSync : string -> unit = "rmdirSync" [@@bs.module "fs"]
external read : int -> Buffer.t -> float -> float -> float Js.Nullable.t -> (exn Js.Nullable.t -> float -> Buffer.t -> unit) -> unit = "read" [@@bs.module "fs"]

type readFile_params = {
  encoding: string [@bs.optional];
  flag: string
} [@@bs.deriving abstract]

external readFile : string -> readFile_params -> Buffer.t callback -> unit = "readFile" [@@bs.module "fs"]
external readFileSync : string -> readFile_params -> Buffer.t = "readFileSync" [@@bs.module "fs"]
external realpathSync : string -> string = "realpathSync" [@@bs.module "fs"]
external write : int -> Buffer.t -> float -> float -> float Js.Nullable.t -> (exn Js.Nullable.t -> float -> Buffer.t -> unit) -> unit = "write" [@@bs.module "fs"]
external writeFile : string -> string -> unit callback -> unit = "writeFile" [@@bs.module "fs"]
external writeFileSync : string -> string -> unit = "writeFileSync" [@@bs.module "fs"]
(* open is a keywork in OCaml.. *)
external openFile : string -> string -> int callback -> unit = "open" [@@bs.module "fs"]
external close : int -> unit callback -> unit = "close" [@@bs.module "fs"]

let read ?position ?(offset=0.) ?length fd buffer cb =
  let position =
    Js.Nullable.fromOption position
  in
  let length =
    match length with
      | Some len -> len
      | None -> Buffer.length buffer -. offset
  in
  read fd buffer offset length position (fun err read buffer ->
    cb err (read,buffer) [@bs])

let write ?position ?(offset=0.) ?length fd buffer cb =
  let position =
    Js.Nullable.fromOption position
  in
  let length =
    match length with
      | Some len -> len
      | None -> Buffer.length buffer -. offset
  in
  write fd buffer offset length position (fun err written str ->
    cb err (written,str) [@bs])

let createStream fn ?path ?fd ?autoClose () =
  let params =
    stream_params ?fd ?autoClose ()
  in
  let default = function
    | None -> Js.Nullable.null
    | Some v -> Js.Nullable.return v
  in
  let path = default path in
  fn path params

let createReadStream = createStream createReadStream
let createWriteStream = createStream createWriteStream
let readFile path =
  readFile path (readFile_params ~flag:"r" ())
let readFileSync path =
  readFileSync path (readFile_params ~flag:"r" ())

external isDirectory : stats -> bool = "isDirectory" [@@bs.send]
external statSync : string -> stats = "statSync" [@@bs.module "fs"]
