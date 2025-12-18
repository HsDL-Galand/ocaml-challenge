(*
Simple calculator
Consider the following variant type to define simple arithmetic operations:

operation = Add of int * int | Sub of int * int | Mul of int * int | Div of int * int
Write a function:

eval : operation -> int option
that evaluates the operation.

Assume integer division; in case of division by zero, the returned value must be None.

Write a function:

make_operation : char -> int -> int -> operation
that, given as input a character ('+', '-', '*', '/') and two integer parameters, returns an operation.
If the first input parameter does not correspond to any of the available operations, or if it is a division with a zero denumerator, then the function must fail.

Write unit tests for your functions, using the assert statement.
*)


type operation = Add of int * int | Sub of int * int | Mul of int * int | Div of int * int

let eval o = match o with
	| Add (a, b) -> Some (a + b)
	| Sub (a, b) -> Some (a - b)
	| Mul (a, b) -> Some (a * b)
	| Div (a, b) -> if (b = 0) then None else Some (a / b)
	(* | Div (a, b) when b = 0 -> None *)	(* SBAGLIATO *)

let make_operation operator p1 p2 = match operator with
	| '+' -> Add (p1, p2)
	| '-' -> Sub (p1, p2)
	| '*' -> Mul (p1, p2)
	| '/' -> if (p2 = 0) then failwith("ERR1") else Div (p1, p2) (* divisione per zero *)
	| _ -> failwith("ERR2") (* l'operatore deve essere uno fra questi + - * / *)
;;
(************************************************* \/ GEMINI \/ *************************************************)

(* type operation = Add of int * int | Sub of int * int | Mul of int * int | Div of int * int

let eval op = match op with
  | Add (a, b) -> Some (a + b)
  | Sub (a, b) -> Some (a - b)
  | Mul (a, b) -> Some (a * b)
  | Div (a, b) -> if b = 0 then None else Some (a / b)

let make_operation c a b = match c with
  | '+' -> Add (a, b)
  | '-' -> Sub (a, b)
  | '*' -> Mul (a, b)
  | '/' -> if b = 0 then failwith "Division by zero" else Div (a, b)
  | _ -> failwith "Invalid operator" *)

(* Assert Tests *)

assert (eval (Add (10, 2)) = Some 12);
assert (eval (Sub (10, 2)) = Some 8);
assert (eval (Mul (10, 2)) = Some 20);
assert (eval (Div (10, 2)) = Some 5);
assert (eval (Div (10, 0)) = None);
assert (make_operation '+' 5 3 = Add (5, 3));;
assert (make_operation '-' 5 3 = Sub (5, 3));;
assert (make_operation '*' 5 3 = Mul (5, 3));;
assert (make_operation '/' 5 3 = Div (5, 3));;

(* Test per le eccezioni *)
assert (try let _ = make_operation '/' 5 0 in false with Failure "ERR1" -> true);;
assert (try let _ = make_operation '%' 5 5 in false with Failure "ERR2" -> true);;