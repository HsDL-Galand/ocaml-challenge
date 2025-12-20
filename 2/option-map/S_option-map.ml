(*
Option map
Write a function option_map that takes a function f and an option value, and returns:

None, if the input value is None;
Some (f x), if the input value is Some x.
The function must have the following type:

option_map : ('a -> 'b) -> 'a option -> 'b option
Here are some unit tests:

let double x = x * 2;;
let square x = x * x;;

assert (option_map double (Some 3) = Some 6);;
assert (option_map double None = None);;
assert (option_map double (Some (square 3)) = Some 18);;
assert (option_map square (option_map double None) = None);;
*)

let option_map (f : 'a -> 'b) (x : 'a option) : 'b option = match x with
	| None -> None
	| Some v -> Some (f v)

let double x = x * 2;;
let square x = x * x;;

assert (option_map double (Some 3) = Some 6);;
assert (option_map double None = None);;
assert (option_map double (Some (square 3)) = Some 18);;
assert (option_map square (option_map double None) = None);;

(*********************************************************** RISOLUZIONE 2025 ***********************************************************)

let option_map2 f o =	(* Sbagliata: tipo non corretto *)
	if (o = None)
		then None
		else Some (f o)

let option_map3 f o = match o with
	| Some o -> Some (f o)
	| None -> None

let double x = x * 2;;
let square x = x * x;;

assert (option_map3 double (Some 3) = Some 6);;
assert (option_map3 double None = None);;
assert (option_map3 double (Some (square 3)) = Some 18);;
assert (option_map3 square (option_map3 double None) = None);;

(*********************************************************** \/ GEMINI \/ ***********************************************************)

let option_map f = function
  | None -> None
  | Some x -> Some (f x)

(* Assert Tests *)
let () =
  let double x = x * 2 in
  let square x = x * x in
  assert (option_map double (Some 3) = Some 6);
  assert (option_map double None = None);
  assert (option_map double (Some (square 3)) = Some 18);
  assert (option_map square (option_map double None) = None)