// Generated by BUCKLESCRIPT VERSION 4.0.17, PLEASE EDIT WITH CARE
'use strict';


function on(param) {
  var variant = param[0];
  if (variant >= -419144110) {
    if (variant >= -418600653) {
      if (variant >= 313061648) {
        if (variant >= 791088858) {
          process.on("uncaughtException", param[1]);
          return /* () */0;
        } else {
          process.on("SIGWINCH", param[1]);
          return /* () */0;
        }
      } else if (variant >= 19585038) {
        process.on("SIGBREAK", param[1]);
        return /* () */0;
      } else {
        process.on("SIGSEV", param[1]);
        return /* () */0;
      }
    } else if (variant >= -419095938) {
      process.on("SIGINT", param[1]);
      return /* () */0;
    } else {
      process.on("SIGHUP", param[1]);
      return /* () */0;
    }
  } else if (variant >= -995060003) {
    if (variant >= -419442481) {
      if (variant >= -419244694) {
        process.on("SIGFPE", param[1]);
        return /* () */0;
      } else {
        process.on("SIGBUS", param[1]);
        return /* () */0;
      }
    } else if (variant >= -983274258) {
      process.on("SIGUSR1", param[1]);
      return /* () */0;
    } else {
      process.on("SIGTERM", param[1]);
      return /* () */0;
    }
  } else if (variant >= -1005404301) {
    process.on("SIGSTOP", param[1]);
    return /* () */0;
  } else {
    process.on("SIGPIPE", param[1]);
    return /* () */0;
  }
}

var argv = process.argv;

function exit(prim) {
  return process.exit(prim);
}

var stdin = process.stdin;

var stderr = process.stderr;

var stdout = process.stdout;

exports.argv = argv;
exports.exit = exit;
exports.on = on;
exports.stdin = stdin;
exports.stderr = stderr;
exports.stdout = stdout;
/* argv Not a pure module */
