(*
# Increment optional value

In OCaml you can use values of type `option` via pattern matching. 
For example, the following function takes as input a value of type `int option` and returns 0 or the value within the Some tag:
let f x = match x with
  None -> 0
| Some x -> x;;

f (Some 3);;
f None;;

Write a function of type:
incr_opt : int option -> int option

that takes an int option and returns `Some(value + 1)` if the input is `Some(value)`. If the input is `None`, return `None`.

**Examples**
incr_opt (Some 5) = Some 6
incr_opt None = None
*)

let f x = match x with
	| None -> 0
	| Some x -> x;;

f (Some 3);;
f None;;

let incr_opt value = match value with
	| None -> None
	| Some value -> Some (value + 1)
;;
assert(incr_opt None = None);;
assert(incr_opt (Some 5) = Some 6);;
assert(incr_opt (Some (-3)) = Some (-2));;