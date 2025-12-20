(*
Optional application
Define an operator with type:

( <*> ) : ('a -> 'b) option -> 'a option -> 'b option
It accepts an optional function and maps it to an optional argument. If there is no function, the result is None, otherwise the result is the same as option_map.

It must pass these unit tests:

let square x = x * x
let double x = 2 * x
let multiply x y = x * y;;

assert (Some square <*> None = None);;
assert (None <*> Some 2 = None);;
assert (None <*> (Some double <*> Some 2) = None);;
assert (Some multiply <*> Some 3 <*> Some 2 = Some 6);;
assert (Some multiply <*> None <*> Some 2 = None);;
*)

let (<*>) f o = match f,o with
	| Some f, Some o -> Some (f o)	(* Esiste sia funzione sia parametro *)
(*	| Some f, None -> None	*)		(* Esiste la funzione ma non il parametro *)
(*	| None, _ -> None		*)		(* Non esise nè la funzione nè il parametro *)
	| _ -> None	(* Riassumibile direttamente così *)

let square x = x * x
let double x = 2 * x
let multiply x y = x * y;;

assert (Some square <*> None = None);;
assert (None <*> Some 2 = None);;
assert (None <*> (Some double <*> Some 2) = None);;
assert (Some multiply <*> Some 3 <*> Some 2 = Some 6);;
assert (Some multiply <*> None <*> Some 2 = None);;

(*********************************************************** \/ GEMINI \/ ***********************************************************)

let (<*>) f x = match f, x with
  | Some f, Some x -> Some (f x)
  | _ -> None

(* Assert Tests *)
let () =
  let double x = x * 2 in
  assert (Some double <*> Some 3 = Some 6);
  assert (None <*> Some 3 = None);
  assert (Some double <*> None = None);
  assert (None <*> None = None)