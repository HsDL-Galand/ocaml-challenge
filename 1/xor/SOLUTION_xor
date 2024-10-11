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
	| _ -> true

(*
ab r
00 0
01 1
10 1
11 0
*)