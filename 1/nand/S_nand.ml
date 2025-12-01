(*
# Logical Nand

Write a function of type:
```ocaml
nand : bool -> bool -> bool
```
that implements the logical connective [nand](https://en.wikipedia.org/wiki/Sheffer_stroke) ("not both").

Try with different implementation styles, using:
- the built-in logical connectives `not`, `&&`, `||`;
- conditional expressions;
- pattern matching.
*)

let nand1 a b = not(a && b)

let nand1_1 (a : bool) (b : bool) : bool = not(a && b)

let nand2 a b = if(a && b) then false else true

let nand2_2 a b = if a then if b then false else true else true
let nand2_3 (a : bool) (b : bool) : bool =
	if a then
		if b then
			false
		else
			true
	else
		true

let nand3 a b = match(a,b) with
	| (false,false) -> true
	| (false,true) -> true
	| (true,false) -> true
	| (true,true) -> false

let nand3_2 (a : bool) (b : bool) : bool = match(a,b) with
	| (true,true) -> false
	| _ -> true


let nand4_1 a b = not (a && b)

let nand4_2 a b = if(a && b == true) then false else true

let nand4_3 a b = match a, b with
		| true, true -> false
		| _ -> true

;;

assert(nand1 false false = true);;
assert(nand1 false true = true);;
assert(nand1 true false = true);;
assert(nand1 true true = false);;

assert(nand1_1 false false = true);;
assert(nand1_1 false true = true);;
assert(nand1_1 true false = true);;
assert(nand1_1 true true = false);;

assert(nand2 false false = true);;
assert(nand2 false true = true);;
assert(nand2 true false = true);;
assert(nand2 true true = false);;

assert(nand2_2 false false = true);;
assert(nand2_2 false true = true);;
assert(nand2_2 true false = true);;
assert(nand2_2 true true = false);;

assert(nand2_3 false false = true);;
assert(nand2_3 false true = true);;
assert(nand2_3 true false = true);;
assert(nand2_3 true true = false);;

assert(nand3 false false = true);;
assert(nand3 false true = true);;
assert(nand3 true false = true);;
assert(nand3 true true = false);;

assert(nand3_2 false false = true);;
assert(nand3_2 false true = true);;
assert(nand3_2 true false = true);;
assert(nand3_2 true true = false);;


assert(nand4_1 false false = true);;
assert(nand4_1 false true = true);;
assert(nand4_1 true false = true);;
assert(nand4_1 true true = false);;

assert(nand4_2 false false = true);;
assert(nand4_2 false true = true);;
assert(nand4_2 true false = true);;
assert(nand4_2 true true = false);;

assert(nand4_3 false false = true);;
assert(nand4_3 false true = true);;
assert(nand4_3 true false = true);;
assert(nand4_3 true true = false);;