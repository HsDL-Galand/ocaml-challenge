(*
Function composition
Write a function comp that takes as input two functions f and g and returns a new function that is the composition of f and g (i.e., f (g x)).

The function must have the following type:

comp : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c
Here are some unit tests:

let double x = x * 2;;
let square x = x * x;;

assert((comp square double) 3 = 36);;
assert((comp double square) 3 = 18);;
assert((comp String.uppercase_ascii String.trim) "hello" = "HELLO");;
*)

(* comp : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c *)
(* comp : ('b -> 'c) -> ('a -> 'b) -> ('a -> 'c) *)
(* comp f(g(x)) *)

let comp f g = fun x -> f(g x)
(* f: 'b -> 'c     f è vincolato ad avere lo stesso tipo di input dell'output di g*)
(* g: 'a -> 'b *)

let double x = x * 2;;
let square x = x * x;;

assert((comp square double) 3 = 36);;
assert((comp double square) 3 = 18);;
assert((comp String.uppercase_ascii String.trim) "hello" = "HELLO");;

(* 
(* ('a->'b)->('c->'a)->'c->'b *)
(* (a > b)>(c > a) > c > b *)
let comp_2 f g = fun x -> f(g x)

(* (a > b)>(int > a) > c > b *)
	let comp_3 f g = fun 3 -> f(g 3)

(* (a > b)>(Z > a) > Y > b *)
	let comp_9 f g = fun y -> f(g z)
*)