// Generated by BUCKLESCRIPT VERSION 3.0.0, PLEASE EDIT WITH CARE
'use strict';

var Url = require("url");

function parse(prim) {
  return Url.parse(prim);
}

function toString(prim) {
  return prim.toString();
}

function toJson(prim) {
  return prim.toJson();
}

exports.parse = parse;
exports.toString = toString;
exports.toJson = toJson;
/* url Not a pure module */
