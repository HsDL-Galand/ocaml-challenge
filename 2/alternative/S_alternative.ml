(*
Alternative
Define a function with type:

( <|> ) : 'a option -> 'a option -> 'a option
that returns the first value available within the Some tag or None if both arguments are None.

Here are some unit tests:

assert (None <|> Some false = Some false);;
assert (Some true <|> None <|> Some false = Some true);;
assert (Some 3 <|> None = Some 3);;
assert (Some "cat" <|> Some "dog" = Some "cat");;
assert (None <|> None <|> Some "dog" <|> None = Some "dog");;
*)

let (<|>) x y = match x, y with
	| Some x, _ -> Some x
	| None, Some y -> Some y
	| _ -> None

let (<||>) x y = match x with	(* Soluzione più corta (il secondo branch ritorna y perchè y vale o "Some y" o "None") *)
	| Some t -> x
	| _ -> y


let (<$>) (Some x) (Some y) = match Some x, Some y with (* SBAGLIATO: non prevede None come input *)
	| Some x, _ -> Some x
	| _ -> None

;;
assert (None <|> Some false = Some false);;
assert (Some true <|> None <|> Some false = Some true);;
assert (Some 3 <|> None = Some 3);;
assert (Some "cat" <|> Some "dog" = Some "cat");;
assert (None <|> None <|> Some "dog" <|> None = Some "dog");;

(*********************************************************** \/ GEMINI \/ ***********************************************************)

let (<|>) a b = match a with
  | Some _ -> a
  | None -> b

(* Assert Tests *)
let () =
  assert (None <|> Some false = Some false);
  assert (Some true <|> None <|> Some false = Some true);
  assert (Some 3 <|> None = Some 3);
  assert (Some "cat" <|> Some "dog" = Some "cat");
  assert (None <|> None <|> Some "dog" <|> None = Some "dog")