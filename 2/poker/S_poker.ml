(*
Poker
Consider the following types to represent French-suited cards:

type suit = S | H | D | C;;
type card = Card of int * suit;;
Write a function with type:

rndHand : unit -> card * card * card * card * card
which generates a random hand of 5 cards.

Then, write a function with type:

poker : card * card * card * card * card -> bool
which evaluates to true iff the hand contains a poker, namely if there are four cards with the same value but different suites.
*)

type suit = S | H | D | C;;
type card = Card of int * suit;;

(*
Creo 5 variabili VALUE
Ciascuna random da 1 a 13
Creo 5 variabili SEED
Ciascuna random da 0 a 3

Creo 5 carte (VALUE, SEED)
mappo SEED ♡◇♧♤0123

Stampo V1 of S1, Vn of Sn

Confronta V1==V2==Vn
*)

let rndHand() =
	let seed1 = Random.int(4) in
	let seed2 = Random.int(4) in
	let seed3 = Random.int(4) in
	let seed4 = Random.int(4) in
	let seed5 = Random.int(4) in
	let rndCard seed = match seed with
	| 0 -> (Random.int(4), S)
	| 1 -> (Random.int(4), H)
	| 2 -> (Random.int(4), D)
	| 3 -> (Random.int(4), C)
	| _ -> failwith("ERR1") in
	(rndCard seed1, rndCard seed2, rndCard seed3, rndCard seed4, rndCard seed5)

let rndHand2() =
	let v1 = Random.int(13)+1 in
	let v2 = Random.int(13)+1 in
	let v3 = Random.int(13)+1 in
	let v4 = Random.int(13)+1 in
	let v5 = Random.int(13)+1 in
	let s1 = Random.int(4) in
	let s2 = Random.int(4) in
	let s3 = Random.int(4) in
	let s4 = Random.int(4) in
	let s5 = Random.int(4) in
	let rndCard2 seed = match seed with
	| 0 -> S
	| 1 -> H
	| 2 -> D
	| 3 -> C
	| _ -> failwith("ERR1") in
	(Card (v1, rndCard2 s1), Card (v2, rndCard2 s2), Card (v3, rndCard2 s3), Card (v4, rndCard2 s4), Card (v5, rndCard2 s5))

let poker2 ((c1 : card),c2,c3,c4,c5) =
	if		(c1=c2 && c1=c3 && c1=c4)
		then true
	else if	(c1=c2 && c1=c3 && c1=c5)
		then true
	else if	(c1=c2 && c1=c4 && c1=c5)
		then true
	else if	(c1=c3 && c1=c4 && c1=c5)
		then true
	else if	(c2=c3 && c2=c4 && c2=c5)
		then true
		else false

(* let poker2 ((Card (v1,s1)), (Card (v2,s2)), (Card (v3,s3)), (Card (v4,s4)), (Card (v5,s5))) match v1,s1,v2,s2 with *)
let poker3 (c1,c2,c3,c4,c5) = match c1, c2, c3, c4, c5 with
	| Card (v1,_), Card (v2,_), Card (v3,_), Card (v4,_), Card (v5,_) when (v1=v2 && v1=v3 && v1=v4)	->	(true , v1, v2, v3, v4, v5)
	| Card (v1,_), Card (v2,_), Card (v3,_), Card (v4,_), Card (v5,_) when (v1=v2 && v1=v3 && v1=v5)	->	(true , v1, v2, v3, v4, v5)
	| Card (v1,_), Card (v2,_), Card (v3,_), Card (v4,_), Card (v5,_) when (v1=v2 && v1=v4 && v1=v5)	->	(true , v1, v2, v3, v4, v5)
	| Card (v1,_), Card (v2,_), Card (v3,_), Card (v4,_), Card (v5,_) when (v1=v3 && v1=v4 && v1=v5)	->	(true , v1, v2, v3, v4, v5)
	| Card (v1,_), Card (v2,_), Card (v3,_), Card (v4,_), Card (v5,_) when (v2=v3 && v2=v4 && v2=v5)	->	(true , v1, v2, v3, v4, v5)
	| Card (v1,_), Card (v2,_), Card (v3,_), Card (v4,_), Card (v5,_)									->	(false, v1, v2, v3, v4, v5)

(*
abcde
VVVV-
VVV-V
VV-VV
V-VVV
-VVVV
*)


(*
Ogni carta
Genero un numero random n da 0 a 3, lo passo a fun(n) che lo mappa come S H D C
Genero un numero random da 1 a 13
*)

(* Assert Tests per poker2 *)
let () =
  assert (poker3 (Card (5,H), Card (5,D), Card (5,S), Card (5,C), Card (2,H)) = (true, 5, 5, 5, 5, 2));
  assert (poker3 (Card (5,H), Card (5,D), Card (5,S), Card (2,C), Card (2,H)) = (false, 5, 5, 5, 2, 2));
  assert (poker3 (Card (2,H), Card (5,D), Card (5,S), Card (5,C), Card (5,H)) = (true, 2, 5, 5, 5, 5))

(********************************************************** \/ GEMINI \/ **********************************************************)

let rndHand_gemini () =
  let rnd_suit () = match Random.int 4 with 0 -> S | 1 -> H | 2 -> D | _ -> C in
  let rnd_card () = Card (Random.int 13 + 1, rnd_suit ()) in
  (rnd_card (), rnd_card (), rnd_card (), rnd_card (), rnd_card ())

let poker_gemini (c1, c2, c3, c4, c5) =
  let val_of (Card (v, _)) = v in
  let values = [val_of c1; val_of c2; val_of c3; val_of c4; val_of c5] in
  let sorted = List.sort compare values in
  match sorted with
  | [a; b; c; d; _] when a = d -> true (* 4 uguali all'inizio *)
  | [_; b; c; d; e] when b = e -> true (* 4 uguali alla fine *)
  | _ -> false

(* Test *)
let () =
  print_endline "\n--- Test Poker User ---";
  (* let h = rndHand () in
  Printf.printf "Poker? %b\n" (poker h); *)
  
  print_endline "\n--- Test Poker Gemini ---";
  (* Testiamo un caso vero di poker *)
  let p_hand = (Card (10, H), Card (10, D), Card (10, S), Card (10, C), Card (2, H)) in
  assert (poker_gemini p_hand = true);
  let np_hand = (Card (10, H), Card (10, D), Card (9, S), Card (10, C), Card (2, H)) in
  assert (poker_gemini np_hand = false)