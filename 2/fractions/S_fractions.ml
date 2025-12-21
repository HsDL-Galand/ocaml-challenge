(*
Comparing fractions
Assume to represent a fraction a/b as a pair (a,b). Write the following functions:

is_posfrac : int * int -> bool
such that is_posfrac (a,b) is true iff (a,b) is a positive fraction (note: if the denominator is 0, then the pair is not a fraction).

compare_posfrac : int * int -> int * int -> int
which compares two positive fractions (failing if one of them is not such). The result of the comparison is:

0, if the two fractions are equal (i.e. they represent the same rational number);
1, if the first fraction is greater than the second;
-1, otherwise
For instance, the following assertions must pass:

assert (compare_posfrac (1,2) (2,4) == 0);;
assert (compare_posfrac (1,2) (1,3) == 1);;
assert (compare_posfrac (1,2) (2,3) == -1);;
Finally, write a function:

compare_frac : int * int -> int * int -> int
which compares two fractions (not necessarily positive).

Warning: it is strictly forbidden to convert the fractions to floats!
*)

let is_posfrac t =
	if		(snd(t) = 0)	(* Caso denominatore = 0 *)
		then failwith("ERR1")
	else if	(fst(t) * snd(t) >= 0)
		then true
		else false

let compare_posfrac (n1, d1) (n2, d2) =
	if		(is_posfrac (n1, d1) = false || is_posfrac (n2, d2) = false)
		then failwith("ERR2")
	else if	(n1*d2 = n2*d1)
		then 0	(* Caso frazioni uguali *)
	else if	(n1*d2 > n2*d1)
		then 1	(* Caso frazione 1 > frazione 2 *)
		else -1	(* Caso frazione 1 < frazione 2 *)

(*  *)

let compare_frac (n1, d1) (n2, d2) =
	if		(is_posfrac (n1, d1) = false && is_posfrac (n2, d2) = true)
		then -1	(* Caso frazione 1 < frazione 2 *) (* -f1 f2 sempre f2 *)
	else if	(is_posfrac (n1, d1) = true && is_posfrac (n2, d2) = false)
		then 1	(* Caso frazione 1 > frazione 2 *) (* f1 -f2 sempre f1 *)

	(* da qui in poi o sono entrambe positive o entrambe negative *)
	else
		if (d1 < 0 && d2 < 0)			(* Caso 3: (-n1 -d1 -n2 -d2) f1 e f2 con D negativo *)
			then
			if	((-n1)*(-d2) = (-n2)*(-d1))
				then 0	(* Caso frazioni uguali *)
			else if	((-n1)*(-d2) > (-n2)*(-d1))
				then 1	(* Caso frazione 1 > frazione 2 *)
				else -1	(* Caso frazione 1 < frazione 2 *)

		else if	(d1 < 0)				(* Caso 1: (-n1 -d1) f1 con D negativo *)
			then
			if	((-n1)*(d2) = (n2)*(-d1))
				then 0	(* Caso frazioni uguali *)
			else if	((-n1)*(d2) > (n2)*(-d1))
				then 1	(* Caso frazione 1 > frazione 2 *)
				else -1	(* Caso frazione 1 < frazione 2 *)

		else if	(d2 < 0)				(* Caso 2: (-n2 -d2) f2 con D negativo *)
			then
			if	((n1)*(-d2) = (-n2)*(d1))
				then 0	(* Caso frazioni uguali *)
			else if	((n1)*(-d2) > (-n2)*(d1))
				then 1	(* Caso frazione 1 > frazione 2 *)
				else -1	(* Caso frazione 1 < frazione 2 *)

		else (* Caso 4: non c'è nessun segno meno - *)
			if		(n1*d2 = n2*d1)
				then 0	(* Caso frazioni uguali *)
			else if	(n1*d2 > n2*d1)
				then 1	(* Caso frazione 1 > frazione 2 *)
				else -1	(* Caso frazione 1 < frazione 2 *)

;;
assert (compare_posfrac (1,2) (2,4) ==  0);;
assert (compare_posfrac (1,2) (1,3) ==  1);;
assert (compare_posfrac (1,2) (2,3) == -1);;

assert (compare_frac (-1,2) ( 3,2) == -1);;
assert (compare_frac ( 1,2) (-3,2) ==  1);;
assert (compare_frac (-3,2) ( 1,2) == -1);;
assert (compare_frac ( 3,2) (-1,2) ==  1);;

assert (compare_frac (-3,2) (-1,2) == -1);;
assert (compare_frac ( 3,2) ( 1,2) ==  1);;

assert (compare_frac (-1,3) ( 3,2) == -1);;
assert (compare_frac ( 1,3) (-3,2) ==  1);;
assert (compare_frac (-3,2) ( 1,3) == -1);;
assert (compare_frac ( 3,2) (-1,3) ==  1);;

assert (compare_frac (-3,2) (-1,3) == -1);;
assert (compare_frac ( 3,2) ( 1,3) ==  1);;

assert (compare_frac (1, -2) (1, -3) = -1);; (* Test critico: entrambi denominatori negativi (-0.5 < -0.33) *)
assert (compare_frac (1, 2) (-1, -3) = 1);; (* 1/2 (0.5) > 1/3 (0.33) *)
assert (compare_frac (1, -2) (-2, 3) = 1);; (* -0.5 > -0.66 *)

(********************************************************** \/ GEMINI \/ **********************************************************)

let is_posfrac (n, d) =
  if d = 0 then false (* Se denom è 0, non è una frazione *)
  else (n > 0 && d > 0) || (n < 0 && d < 0) (* Positiva se numeratore e denominatore sono concordi (e non nulli) *)

let compare_frac (n1, d1) (n2, d2) =
  if d1 = 0 || d2 = 0 then failwith "Invalid fraction"
  else
    (* Normalizziamo i segni per avere sempre denominatori positivi *)
    let n1, d1 = if d1 < 0 then (-n1, -d1) else (n1, d1) in
    let n2, d2 = if d2 < 0 then (-n2, -d2) else (n2, d2) in
    let lhs = n1 * d2 in
    let rhs = n2 * d1 in
    if lhs = rhs then 0
    else if lhs > rhs then 1
    else -1

let compare_posfrac f1 f2 =
  if not (is_posfrac f1) || not (is_posfrac f2) then failwith "Not positive fractions"
  else compare_frac f1 f2

(* Assert Tests Gemini *)
let () =
  assert (compare_posfrac (1, 2) (2, 4) = 0);
  assert (compare_posfrac (1, 2) (1, 3) = 1);
  assert (compare_posfrac (1, 2) (2, 3) = -1);
  assert (compare_frac (1, -2) (-1, 3) = -1);
  assert (compare_frac (1, 2) (-1, -3) = 1);
  assert (compare_frac (1, -2) (-2, 3) = 1)