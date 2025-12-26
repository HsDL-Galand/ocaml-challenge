(*
Loaded dice
Write a function with type:

dice : int -> int
which throws a loaded dice, where the probability of a 6 is specified by the argument (in percentage), while the other sides are uniform.
For instance, dice 80 will throw a loaded dice where the probability of 6 is 80%, while the probability of the other sides is 4%.
*)

let dice p =
	if	((Random.int(100)+1) <= p)
		then 6
		else (Random.int(5)+1)

(*
p = 80
rolla un numero da 1 a 100
se esce un numero < p, allora -> 6
altrimenti -> random 1-5
*)

(********************************************************** \/ GEMINI \/ **********************************************************)

let dice p =
  if Random.int 100 < p then
    6
  else
    Random.int 5 + 1