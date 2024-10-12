(*
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

let mux4_1 s0 s1 a0 a1 a2 a3 = 
	a0 && not s0 && not s1 ||
	a1 && not s0 && s1 ||
	a2 && s0 && not s1 ||
	a3 && s0 && s1

let mux4_2 s0 s1 a0 a1 a2 a3 =
	if s0 then
		if s1 then
			a3
		else
			a2
	else
		if s1 then
			a1
		else
			a0

let mux4_3 s0 s1 a0 a1 a2 a3 = match s0,s1 with
	| false, false -> a0
	| false, true -> a1
	| true, false -> a2
	| true, true -> a3

;;
assert(not(mux4_1 false false false false false false));;
assert(mux4_1 false false true false false false);;
assert(not(mux4_1 false true false false false false));;
assert(mux4_1 false true false true false false);;
assert(not(mux4_1 true false false false false false));;
assert(mux4_1 true false false false true false);;
assert(not(mux4_1 true true false false false false));;

assert(not(mux4_2 false false false false false false));;
assert(mux4_2 false false true false false false);;
assert(not(mux4_2 false true false false false false));;
assert(mux4_2 false true false true false false);;
assert(not(mux4_2 true false false false false false));;
assert(mux4_2 true false false false true false);;
assert(not(mux4_2 true true false false false false));;
assert(mux4_2 true true false false false true);;

assert(not(mux4_3 false false false false false false));;
assert(mux4_3 false false true false false false);;
assert(not(mux4_3 false true false false false false));;
assert(mux4_3 false true false true false false);;
assert(not(mux4_3 true false false false false false));;
assert(mux4_3 true false false false true false);;
assert(not(mux4_3 true true false false false false));;
assert(mux4_3 true true false false false true);;