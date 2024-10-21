(*
x to the ninth
Write a function with type:

square : int -> int
such that square x evaluates to the square of x.

Use this function to write a function with type:

exp9: int -> int
which computes the 9th power of the argument. This function should perform the lowest possible number of multiplications.
*)

(* square : int -> int *)
(* exp9: int -> int *)

(* let square (x : int) : int = 0 *)
let square x = x*x

(* let exp9 (x : int) : int = 0 *)
let exp9 x = x*x*x*x*x*x*x*x*x

let exp9_1 x = square (square x) * square (square x) * x

;;
assert(square 2 = 4);;
assert(square 4 = 16);;

assert(exp9 2 = 512);;
assert(exp9 3 = 19683);;

assert(exp9_1 2 = 512);;
assert(exp9_1 3 = 19683);;