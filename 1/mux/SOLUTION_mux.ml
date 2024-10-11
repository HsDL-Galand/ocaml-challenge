(*
# Multiplexer

Write a function of type:
mux2 : bool -> bool -> bool -> bool
such that 
`mux2 s0 a b` equals to `a` if `s0` is true, otherwise it equals to `b`.

Try with different implementation styles, using:
- the built-in logical connectives `not`, `&&`, `||`;
- conditional expressions;
- pattern matching.

Then, write a function of type:
mux4 : bool -> bool -> bool -> bool -> bool -> bool -> bool

such that
`mux4 s1 s0 a0 a1 a2 a3` equals to `ai` if `s1 s0` is the binary encoding of `i`.

The function `mux4` must pass the following unit tests:
assert(mux4 false false false true false true = false);;
assert(mux4 false true false true false true = true);;
assert(mux4 true false false true false true = false);;
assert(mux4 true true false true false true = true);;

In the implementation of `mux4`, try to reuse `mux2`.
*)

let mux2_1 s0 a b = not(s0)&&b || s0&&a

let mux2_2 s0 a b =
	if s0 then
		a
	else
		b

let mux2_3 s0 a b = match (s0,a,b) with
	| (false, _, true) -> true
	| (false, _, false) -> false
	| (true, false, _) -> false
	| (true, true, _) -> true

;;
assert(mux2_1 false false false = false);;
assert(mux2_1 false false true = true);;
assert(mux2_1 false true false = false);;
assert(mux2_1 false true true = true);;
assert(mux2_1 true false false = false);;
assert(mux2_1 true false true = false);;
assert(mux2_1 true true false = true);;
assert(mux2_1 true true true = true);;

assert(mux2_2 false false false = false);;
assert(mux2_2 false false true = true);;
assert(mux2_2 false true false = false);;
assert(mux2_2 false true true = true);;
assert(mux2_2 true false false = false);;
assert(mux2_2 true false true = false);;
assert(mux2_2 true true false = true);;
assert(mux2_2 true true true = true);;

assert(mux2_3 false false false = false);;
assert(mux2_3 false false true = true);;
assert(mux2_3 false true false = false);;
assert(mux2_3 false true true = true);;
assert(mux2_3 true false false = false);;
assert(mux2_3 true false true = false);;
assert(mux2_3 true true false = true);;
assert(mux2_3 true true true = true);;

(*
s0 a b
 0 0 0	0 --
 0 0 1	1 -
 0 1 0	0 --
 0 1 1	1 -
 1 0 0	0 ---
 1 0 1	0 ---
 1 1 0	1 ----
 1 1 1	1 ----
*)