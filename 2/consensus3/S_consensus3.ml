(*
Consensus3
Define a function with type:

consensus3 : ('a -> 'b) * ('a -> 'b) * ('a -> 'b) -> 'a -> 'b option
The function takes as input 3 functions with the same type, and it outputs a function with type:

'a -> 'b
By applying consensus3 to a triple of functions (f0,f1,f2), the output function f satisfies the following properties:

f n is undefined if at least one of the 3 input functions is undefined on the input n
f n = Some v if at least 2 out of 3 input functions give v as output on the input n
f n = None otherwise.
For instance:

assert (consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 1 = Some 5);;
assert (consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 2 = Some 2);;
assert (consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 3 = None);;
assert (
  try
    consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 0
    |> ignore; false
  with _ -> true);;
*)

(* consensus3_9 : ('a -> 'b) * ('a -> 'b) * ('a -> 'b) -> 'a -> 'b option *)
let consensu3_9 (f0,f1,f2) = fun x -> f0(f1(f2(x)))

(* consensus3 : ('a -> 'b) * ('a -> 'b) * ('a -> 'b) -> 'a -> 'b option *)
(* let consensus3 (f0,f1,f2) n = match f0,f1,f2 with (* SBAGLIATA *)
	| None, _, _
	| _, None, _
	| _, _, None -> failwith "undefined"
	| Some v1, Some v2, _
	| Some v1, _, Some v2
	| _, Some v1, Some v2 -> Some v1
	| _ -> None
;; *)

(********************************************************** \/ SOLUZIONE 2025 \/ **********************************************************)

let consensus3_1 (f0, f1, f2) = fun x -> match f0, f1, f2, x with
	(* | _ when (f0 x = None || f1 x = None || f2 x = None) -> failwith("ERR1") *) (* Questa credo sia sbagliata, se f n è undefined non devo gestire il caso *)
	| _ when (f0 x = f1 x || f0 x = f2 x) -> Some (f0 x)	(* Caso 1: f0=f1 o f0=f2 *)
	| _ when (f1 x = f2 x) -> Some (f1 x)	(* Caso 2: f1=f2 *)
	| _ -> None

let consensus3_2 (f0, f1, f2) = fun x ->
	let v0 = f0 x in
	let v1 = f1 x in
	let v2 = f2 x in
	match f0, f1, f2, x with
	(* | _ when (f0 x = None || f1 x = None || f2 x = None) -> failwith("ERR1") *) (* Questa credo sia sbagliata, se f n è undefined non devo gestire il caso *)
	| _ when (v0 = v1 || v0 = v2)	-> Some (v0)	(* Caso 1: f0=f1 o f0=f2 *)
	| _ when (v1 = v2) 				-> Some (v1)	(* Caso 2: f1=f2 *)
	| _ -> None

let consensus3_3 (f0, f1, f2) = fun x ->
	let v0 = f0 x in
	let v1 = f1 x in
	let v2 = f2 x in
	if		(v0 = v1 || v0 = v2)
		then Some (v0)
	else if	(v1 = v2)
		then Some (v1)
		else None

;;
assert (consensus3_1 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 1 = Some 5);;
assert (consensus3_1 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 2 = Some 2);;
assert (consensus3_1 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 3 = None);;
assert (
try
	consensus3_1 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 0
	|> ignore; false
with _ -> true);;

assert (consensus3_2 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 1 = Some 5);;
assert (consensus3_2 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 2 = Some 2);;
assert (consensus3_2 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 3 = None);;
assert (
try
	consensus3_2 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 0
	|> ignore; false
with _ -> true);;

assert (consensus3_3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 1 = Some 5);;
assert (consensus3_3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 2 = Some 2);;
assert (consensus3_3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 3 = None);;
assert (
try
	consensus3_3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 0
	|> ignore; false
with _ -> true);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let consensus3 (f0, f1, f2) x =
  let v0 = f0 x in
  let v1 = f1 x in
  let v2 = f2 x in
  if v0 = v1 || v0 = v2 then Some v0
  else if v1 = v2 then Some v1
  else None

(* Assert Tests *)
let () =
  assert (consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 1 = Some 5);
  assert (consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 2 = Some 2);
  assert (consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 3 = None);
  assert (
    try
      consensus3 ((fun x -> x), (fun y -> y+4), (fun z -> 5/z)) 0
      |> ignore; false
    with _ -> true)