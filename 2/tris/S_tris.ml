(*
Tris
Write a function with type:

tris : 'a * 'a * 'a * 'a -> bool
such that tris (a,b,c,d) is true iff at least three elements of the quadruple (a,b,c,d) are equal.

Then, test the function through a function with type:

hand : unit -> int * int * int * int
which generates a random quadruple of elements in the range 1..10.
*)

let tris (a,b,c,d) =
	if		(a = b && a = c)
		then true
	else if	(a = b && a = d)
		then true
	else if	(a = c && a = d)
		then true
	else if	(b = c && b = d)
		then true
		else false
(*
abcd
XXX-
XX-X
X-XX
-XXX
*)

let tris2 (a,b,c,d) = ((a=b && a=c) || (a=b && a=d) || (a=c && a=d) || (b=c && b=d))

let hand () = ((Random.int(10)+1), (Random.int(10)+1), (Random.int(10)+1), (Random.int(10)+1))

let showHand() =
	let a = (Random.int(10)+1) in
	let b = (Random.int(10)+1) in
	let c = (Random.int(10)+1) in
	let d = (Random.int(10)+1) in
	Printf.printf "(%d, %d, %d, %d)\n" a b c d;
	(a,b,c,d)

(********************************************************** \/ GEMINI \/ **********************************************************)

let tris_gemini (a, b, c, d) =
  (a=b && b=c) || (a=b && b=d) || (a=c && c=d) || (b=c && c=d)

let hand_gemini () =
  (Random.int 10 + 1, Random.int 10 + 1, Random.int 10 + 1, Random.int 10 + 1)

(* Test deterministici per la funzione tris *)
let () =
  assert (tris (1, 1, 1, 2) = true);
  assert (tris (1, 2, 1, 1) = true);
  assert (tris (2, 1, 1, 1) = true);
  assert (tris (1, 1, 1, 1) = true);
  assert (tris (1, 2, 3, 4) = false);
  assert (tris (1, 1, 2, 2) = false)

(* Test "manuale" per la funzione randomica hand, come discusso *)
let () =
  print_endline "\n--- Esempio di test di una funzione randomica ---";
  let h = hand_gemini () in
  let (a,b,c,d) = h in
  Printf.printf "Mano generata: (%d, %d, %d, %d) -> Tris? %b\n" a b c d (tris h)