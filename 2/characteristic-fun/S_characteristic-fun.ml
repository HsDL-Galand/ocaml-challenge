(*
Characteristic functions
Given a set A of elements in a domain U, its characteristic function χA is defined as follows:
- χA(x) = 1 if x ∈ A
- χA(x) = 0 if x ∉ A
Implement the characteristic function of the following sets, where the universe is the set of natural numbers.

For each item i in the list, the functions must have type:

fi : int -> int
The functions must be undefined on the negative integers:
you can use the failwith construct for this purpose.
*)

(*
 1) ∅
 2) {0, 1, 2}
 3) {x | 0 < x < 100}
 4) {x | false }
 5) {x | ∀y. x + y ≥ x}
 6) {x | ∃y. x = y + y}
 7) {x | ∃y. y = x + x}
 8) {x | ∃y. x < y}
 9) {x | ∃y. x * x = y}
10) {x | ∃y. y < 3 ∧ 7 < x*y < 20 }
11) {x | x < 50 ∧ ∃y. x = y + y}
12) {z | ∃x. z = 2 x ∧ 0 < 2x < 50 }
13) {z | ∃x, y. z = x + y ∧ x * y ≤ 20}
14) {x | ∀y. y < x → y < 2 }
15) {x | ∀y. (x mod y = 0) → (y=1 ∨ y=x) }
*)

let f1  n = if n<0 then failwith("ERR1")  else 0										(*  1) ∅ *)
let f2  n = if n<0 then failwith("ERR2")  else if n=0 || n=1 || n=2 then 1 else 0		(*  2) {0, 1, 2} *)
let f3  n = if n<0 then failwith("ERR3")  else if n>0 && n<100 then 1 else 0			(* 	3) {x | 0 < x < 100} *)
let f4  n = if n<0 then failwith("ERR4")  else 0										(*  4) {x | false } *)
let f5  n = if n<0 then failwith("ERR5")  else 1										(*  5) {x | ∀y. x + y ≥ x} *)				(* Ogni N sommato a un N è almeno maggiore o uguale al primo N *)
let f6  n = if n<0 then failwith("ERR6")  else if (n mod 2 = 0) then 1 else 0			(*  6) {x | ∃y. x = y + y} *)				(* I dispari non possono essere ottenuti con la somma di due numeri uguali*)
let f7  n = if n<0 then failwith("ERR7")  else 1										(*  7) {x | ∃y. y = x + x} *)				(* N + N = N *)
let f8  n = if n<0 then failwith("ERR8")  else 1										(*  8) {x | ∃y. x < y} *)					(* basta che la y sia il successore di x *)
let f9  n = if n<0 then failwith("ERR9")  else 1										(*  9) {x | ∃y. x * x = y} *)				(* N * N = N *)
let f10 n = if n<0 then failwith("ERR10") else if (n>3 && n<20)	then 1 else 0			(* 10) {x | ∃y. y<3  ∧  7 < x*y < 20 } *)	(* Numeri compresi tra 4 e 19 *)
(* X  x * y y  R  R *)
(* F  0 * 1 2  0  0 *)
(* F  1 * 1 2  1  2 *)
(* F  3 * 1 2  3  6 *)
(* V  4 * 1 2  4  8 *)
(* V  7 * 1 2  7 14 *)
(* V  8 * 1 2  8 16 *)
(* V 10 * 1 2 10 20 *)
(* V 11 * 1 2 11 22 *)
(* V 19 * 1 2 19 38 *)
(* F 20 * 1 2 20 40 *)
let f11 n = if n<0 then failwith("ERR11") else if(n<50 && (n mod 2=0)) then 1 else 0				(* 11) {x | x < 50  ∧  ∃y. x = y + y} *)		(* I pari < 50 *)
let f12 n = if n<0 then failwith("ERR12") else if(n<50 && (n mod 2=0) && not(n=0)) then 1 else 0	(* 12) {z | ∃x. z = 2x  ∧  0 < 2x < 50 } *)		(* I pari < 50 eccetto 0*)
let f13 n = if n<0 then failwith("ERR13") else 1 (*NO: if(n<=20) then 1 else 0*)					(* 13) {z | ∃x, y. z = x + y  ∧  x*y ≤ 20} *)	(* esistono due N il cui prodotto <= 20 dà come somma INP? mi basta prendere come x:0 e come y: tutti i numeri da 0 a 20 NO, y: TUTTI I NATURALI *)
(*
	 0 +  0 =  0	 0 *  0 =  0 <= 20
	 1 +  0 =  1	 1 *  0 =  1 <= 20
	 1 + 19 = 20	 1 * 19 = 19 <= 20
	 2 +  0 =  2	 2 *  0 =  0 <= 20
	 2 +  9 = 11	 2 *  9 = 18 <= 20
	 2 + 10 = 12	 2 * 10 = 20 <= 20
	 3 +  5 =  8	 2 * 10 = 20 <= 20
	 3 +  6 =  9	 3 *  6 = 18 <= 20
	20 +  0 = 20	20 *  0 =  0 <= 20
	30 +  0 = 30	30 *  0 =  0 <= 20
*)
let f14 n = if n<0 then failwith("ERR14") else if(n < 3) then 1 else 0					(* 14) {x | ∀y. y < x → y < 2 } *)				(* implicazione falsificata da V->F ovvero con x:1|2 *)
(*
V     → F
X y < x → y < 2
V 0   1 → 0 < 2
V 1   2 → 1 < 2
F 2   3 → 2 < 2
F 3   4 → 3 < 2
*)

let rec is_prime n acc = match n, acc with
	| 0, 0 -> 0	(* Caso n:0 *)
	| n, a when (n = 1 || acc = 1 ) -> 1	(* Caso base: quando n:1|2 oppure quando non è stato trovato un divisore *)
	| _ -> if(n mod acc = 0) then 0 else (is_prime n (acc-1))

let f15 n = if n<0 then failwith("ERR15") else (is_prime n (n/2))	(* 15) {x | ∀y. (x mod y = 0) → (y=1 ∨ y=x) } *)	(* Mi sembra che siano tutti i numeri primi e anche l'1*)
(*
X (x mod y = 0) → (y=1 V y=x)
F  0 mod 2 = 0  →  2=1 V 2=0
V  1 mod 1 = 0  →  1=1 V 1=1
V  2 mod 2 = 0  →  2=1 V 2=2
F  4 mod 2 = 0  →  2=1 V 2=4
*)

let rec is_prim_gabri n max = 
	if (max mod n = 0) && not(n=max)
		then 0
		else 
			if (n = max)
				then 1
				else is_prim_gabri (n+1) (max)
;;

let f15_gabri x=
	if x<0
		then failwith"numero non naturale"
		else
			if x<2
				then 0
				else is_prim_gabri 2 x
;;

(* try Printf.printf "f15 0 = %d\n" (f15 0) with Failure msg -> Printf.printf "f15 0 = Exception: %s\n" msg;;
Printf.printf "f15 1 = %d\n" (f15 1);;
Printf.printf "f15 2 = %d\n" (f15 2);;
Printf.printf "f15 3 = %d\n" (f15 3);;
Printf.printf "f15 4 = %d\n" (f15 4);;
Printf.printf "f15 13 = %d\n" (f15 13);;
Printf.printf "f15 20 = %d\n" (f15 20);; *)

(* assert (try let _ = f15 0 in false with Failure "ERR15" -> true | _ -> false);; *)
assert (try let _ = f15 (-1) in false with Failure _ -> true);;
assert(f15 0 = 0);;
assert(f15 1 = 1);;
assert(f15 2 = 1);;
assert(f15 3 = 1);;
assert(f15 4 = 0);;
assert(f15 13 = 1);;
assert(f15 20 = 0);;

(* Assert Tests per le tue funzioni (f1 - f14) *)
let () =
  assert (f1 10 = 0);
  assert (f2 0 = 1 && f2 2 = 1 && f2 3 = 0);
  assert (f3 50 = 1 && f3 100 = 0);
  assert (f4 0 = 0);
  assert (f5 100 = 1);
  assert (f6 4 = 1 && f6 5 = 0);
  assert (f7 10 = 1);
  assert (f8 0 = 1);
  assert (f9 10 = 1);
  assert (f10 3=0 && f10 4=1 && f10 8=1 && f10 20=0);
  assert (f11 48 = 1 && f11 50 = 0 && f11 49 = 0);
  assert (f12 0 = 0 && f12 2 = 1 && f12 50 = 0);
  assert (f13 100 = 1);
  assert (f14 0 = 1 && f14 1 = 1 && f14 2 = 1 && f14 3 = 0)

(********************************************************** \/ GEMINI \/ **********************************************************)

let f1 _ = 0
let f2 x = if x >= 0 && x <= 2 then 1 else 0
let f3 x = if x > 0 && x < 100 then 1 else 0
let f4 _ = 0
let f5 _ = 1
let f6 x = if x mod 2 = 0 then 1 else 0
let f7 _ = 1
let f8 _ = 1
let f9 _ = 1
let f10 x = if x >= 4 && x <= 19 then 1 else 0
let f11 x = if x < 50 && x mod 2 = 0 then 1 else 0
let f12 x = if x > 0 && x < 50 && x mod 2 = 0 then 1 else 0
let f13 _ = 1
let f14 x = if x <= 2 then 1 else 0
let f15 x = 
  let rec is_prime n i =
    if i * i > n then 1
    else if n mod i = 0 then 0
    else is_prime n (i + 1)
  in
  if x <= 0 then 0 (* 0 non è primo, e non soddisfa la condizione *)
  else if x = 1 then 1 (* 1 soddisfa la condizione vacua o specifica *)
  else is_prime x 2