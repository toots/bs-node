// Generated by BUCKLESCRIPT VERSION 4.0.0, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Events = require("events");

function on(emitter, label, handler) {
  emitter.on(label, Curry.__1(handler));
  return /* () */0;
}

function make() {
  return new Events();
}

function emit(prim, prim$1, prim$2) {
  prim.emit(prim$1, prim$2);
  return /* () */0;
}

exports.make = make;
exports.on = on;
exports.emit = emit;
/* events Not a pure module */
