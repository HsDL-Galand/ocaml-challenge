let mux2 a0 b1 s0 = match s0 with
	| false -> a0
	| true -> b1

(*
	s0	s1	
	0	0	a0
	0	1	a1

	1	0	a2
	1	1	a3
*)

let mux4 s0 s1 a0 a1 a2 a3 =
	mux2 (mux2 a0 a1 s1) (mux2 a2 a3 s1) s0

;;
(*			s0 		s1		a0		a1		a2		a3		OUT*)
(*			0 		0		0		0		0		0		0	*)
assert(mux4 false	false	false	false	false	false = false);;
assert(mux4 false	false	true	false	false	false = true);;


let zux2 s0 (a0:bool) b1 = match s0 with
	| false -> a0
	| true -> b1

let zux4 s0 s1 a0 a1 a2 a3 =
	if s0
		then zux2 s1 a2 a3 (*chiama mux2 col valore s1 a2 a3*)
		else zux2 s1 a0 a1 (*chiama mux2 col valore s1 a0 a1*)


let xux4 s0 s1 a0 a1 a2 a3 =
	zux2 s0 (zux2 s1 a0 a1) (zux2 s1 a2 a3)
;;

(*			s0		s1		a0		a1		a2		a3		  OUT*)
(*			0		0		0		0		0		0		  0	*)
assert(zux4 false	false	false	false	false	false	= false);;
assert(zux4 false	false	true	false	false	false	= true);;

assert(zux4 false	true	false	false	false	false	= false);;
assert(zux4 false	true	false	true	false	false	= true);;

assert(zux4 true 	false	false	false	false	false	= false);;
assert(zux4 true	false	false	false	true	false	= true);;

assert(zux4 true 	true	false	false	false	false	= false);;
assert(zux4 true	true	false	false	false	true	= true);;


assert(xux4 false	false	false	false	false	false	= false);;
assert(xux4 false	false	true	false	false	false	= true);;

assert(xux4 false	true	false	false	false	false	= false);;
assert(xux4 false	true	false	true	false	false	= true);;

assert(xux4 true 	false	false	false	false	false	= false);;
assert(xux4 true	false	false	false	true	false	= true);;

assert(xux4 true 	true	false	false	false	false	= false);;
assert(xux4 true	true	false	false	false	true	= true);;

(*
	s0	s1	
	0	0	a0
	0	1	a1

	1	0	a2
	1	1	a3
*)