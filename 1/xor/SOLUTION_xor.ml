(*# Logical Xor

Write a function of type:
```ocaml
xor : bool -> bool -> bool
```
that implements the logical connective [xor](https://en.wikipedia.org/wiki/Exclusive_or) ("exclusive or").

Try with different implementation styles, using:
- the built-in logical connectives `not`, `&&`, `||`;
- conditional expressions;
- pattern matching.
*)

let xor1 a b = not(a&&b) && (a||b)
let xor1_2 (a : bool) (b : bool) : bool = not(a&&b) && (a||b)

let xor1_3 : bool -> bool -> bool =
	fun a b ->
		not a && b || a && not b



let xor2 a b =
	if a = b
		then false
		else true

let xor2_2 (a : bool) (b : bool) : bool =	if a = b then false else true



let xor3 a b = match (a,b) with
	| (false,false) -> false
	| (false,true) -> true
	| (true,false) -> true
	| (true,true) -> false

let xor3_2 a b = match (a,b) with
	| (false,false) -> false
	| (true,true) -> false
	| _ -> true;;

assert(xor1 false false = false);;
assert(xor1 false true = true);;
assert(xor1 true false = true);;
assert(xor1 true true = false);;

assert(xor1_2 false false = false);;
assert(xor1_2 false true = true);;
assert(xor1_2 true false = true);;
assert(xor1_2 true true = false);;

assert(xor1_3 false false = false);;
assert(xor1_3 false true = true);;
assert(xor1_3 true false = true);;
assert(xor1_3 true true = false);;

assert(xor2 false false = false);;
assert(xor2 false true = true);;
assert(xor2 true false = true);;
assert(xor2 true true = false);;

assert(xor2_2 false false = false);;
assert(xor2_2 false true = true);;
assert(xor2_2 true false = true);;
assert(xor2_2 true true = false);;

assert(xor3 false false = false);;
assert(xor3 false true = true);;
assert(xor3 true false = true);;
assert(xor3 true true = false);;

assert(xor3_2 false false = false);;
assert(xor3_2 false true = true);;
assert(xor3_2 true false = true);;
assert(xor3_2 true true = false);;

(*
ab r
00 0
01 1
10 1
11 0
*)