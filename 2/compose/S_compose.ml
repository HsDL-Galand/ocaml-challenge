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

let old_comp f g = fun x -> f(g x)
(* f: 'b -> 'c     f è vincolato ad avere lo stesso tipo di input dell'output di g*)
(* g: 'a -> 'b *)

let old_double x = x * 2;;
let old_square x = x * x;;

assert((old_comp old_square old_double) 3 = 36);;
assert((old_comp old_double old_square) 3 = 18);;
assert((old_comp String.uppercase_ascii String.trim) "hello" = "HELLO");;

(* 
(* ('a->'b)->('c->'a)->'c->'b *)
(* (a > b)>(c > a) > c > b *)
let comp_2 f g = fun x -> f(g x)

(* (a > b)>(int > a) > c > b *)
	let comp_3 f g = fun 3 -> f(g 3)

(* (a > b)>(Z > a) > Y > b *)
	let comp_9 f g = fun y -> f(g z)
*)

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
(* comp : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b *)
(* comp : (1b -> 2c) -> (3a -> 1b) -> 3a -> 2c *)
let old_comp_10 f g = fun x -> f(g(x))

let old_double_10 x = x * 2;;
let old_square_10 x = x * x;;

assert((old_comp_10 old_square_10 old_double_10) 3 = 36);;
assert((old_comp_10 old_double_10 old_square_10) 3 = 18);;
assert((old_comp_10 String.uppercase_ascii String.trim) "hello" = "HELLO");;

(* ********************************************************** RISOLUZIONE 2025 ********************************************************** *)
let comp f g x = f (g x)
let comp2 f g x = g x |> f
let comp3 f g = fun x -> f (g x)
let comp4 f = fun g -> fun x -> f (g x)
let comp5 = fun f -> fun g -> fun x -> f (g x)

let double x = x * 2;;
let square x = x * x;;

assert((comp square double) 3 = 36);;
assert((comp double square) 3 = 18);;

assert(comp (fun b -> if b then 0 else 1) (fun x -> x>0) 3 = 0);;
assert(comp (fun b -> if b then 0 else 1) (fun x -> x>0) 0 = 1);;

(***************************** \/ GEMINI \/ *****************************)

let comp f g x = f (g x)

(* Assert Tests *)
let () =
  let double x = x * 2 in
  let square x = x * x in
  assert (comp square double 3 = 36);
  assert (comp double square 3 = 18);
  assert (comp String.uppercase_ascii String.trim " hello " = "HELLO");
  assert (comp (fun x -> x > 0) (fun x -> x - 1) 2 = true);
  assert (comp (fun x -> x > 0) (fun x -> x - 1) 0 = false)