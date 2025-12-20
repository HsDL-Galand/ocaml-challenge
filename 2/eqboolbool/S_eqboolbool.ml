(*
Equality of boolean functions
Write an infix function called =?:

( =? ) : (bool -> bool) (bool -> bool) -> bool
that checks whether two boolean functions are equal,
i.e. they map the same inputs to the same outputs.

For example, the following unit tests hold:

assert ((fun b -> true) =? (fun b -> true));;
assert ((fun b -> b) =? (fun b -> true) = false);;
assert ((fun b -> false) =? (fun b -> true) = false);;
assert (not =? (fun b -> not (not b)) = false);;
assert ((fun b -> b) =? (fun b -> not (not b)));;
*)

let (|=?) f g = fun (x : bool) -> ((f x) = (g x))
let (||=?) f g (x:bool) = ((f x) = (g x))

let (|||=?) f g (x:bool) =
	if ((f x) = (g x))
		then true
		else false

let (||||=?) f g (x:bool) = match f, g, x with
	| f, g, x when (f x = g x)-> true
	| _ -> false

let (|||||=?) f g = fun (x : bool) -> (((f x):bool) = (g x))

let (=?) f g = (f true = g true) && (f false = g false)
let (|=?) (f: bool->bool) (g: bool->bool) = (f true = g true) && (f false = g false)

;;
assert ((fun b -> true) =? (fun b -> true));;
assert ((fun b -> b) =? (fun b -> true) = false);;
assert ((fun b -> false) =? (fun b -> true) = false);;
assert (not =? (fun b -> not (not b)) = false);;
assert ((fun b -> b) =? (fun b -> not (not b)));;

(********************************************************** \/ GEMINI \/ **********************************************************)

let (=?) f g =
  (f true = g true) && (f false = g false)

(* Assert Tests *)
let () =
  assert ((fun b -> true) =? (fun b -> true));
  assert ((fun b -> b) =? (fun b -> true) = false);
  assert ((fun b -> false) =? (fun b -> true) = false);
  assert (not =? (fun b -> not (not b)) = false);
  assert ((fun b -> b) =? (fun b -> not (not b)))