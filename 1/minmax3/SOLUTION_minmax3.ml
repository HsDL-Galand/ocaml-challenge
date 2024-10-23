(*
Min and max of three values
Write a function with type:

minmax3 : 'a -> 'a -> 'a -> 'a * 'a
such that che minmax3 a b c evaluates to a pair whose left element is the minimum of a, b, c, while the right element is the maximum.
*)

(* minmax3 : 'a -> 'a -> 'a -> 'a * 'a *)
(* let minmax3 a b c = a * c *)
let minmax3 a b c =
	if a<b && a<c then
		(* A minor *)
		if b>c then
			a*b
		else
			a*c
	else if b<c then
		(* B minor *)
		if a>c then
			b*a
		else
			b*c
	else
		(* C minor *)
		if a>b then
			c*a
		else
			c*b

let minmax3_2 a b c =
	if a<b && a<c then
		(* A minor *)
		if b>c then
			a,b
		else
			a,c
	else if b<c then
		(* B minor *)
		if a>c then
			b,a
		else
			b,c
	else
		(* C minor *)
		if a>b then
			c,a
		else
			c,b

(* trova il minore e moltiplicalo per il maggiore *)

;;
assert(minmax3 1 2 3 = 1*3);;
assert(minmax3 3 2 1 = 3*1);;
assert(minmax3 10 30 20 = 30*10);;
assert(minmax3 22 11 33 = 33*11);;

assert(minmax3 1 1 1 = 1*1);;
assert(minmax3 3 3 3 = 3*3);;

assert(minmax3 (-1) (-2) (-3) = (-1)*(-3));;
assert(minmax3 (-4) (-3) (-2) = (-2)*(-4));;



assert(minmax3_2 1 2 3 = (1,3));;
assert(minmax3_2 3 2 1 = (1,3));;
assert(minmax3_2 10 30 20 = (10,30));;
assert(minmax3_2 22 11 33 = (11,33));;

assert(minmax3_2 1 1 1 = (1,1));;
assert(minmax3_2 3 3 3 = (3,3));;

assert(minmax3_2 (-1) (-2) (-3) = ((-3),(-1)));;
assert(minmax3_2 (-4) (-3) (-2) = ((-4),(-2)));;