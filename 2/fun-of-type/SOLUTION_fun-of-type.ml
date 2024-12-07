(*
From type to function
Write functions with the following types.
For clarity, in the types below we have added parentheses.
Recall however that the -> operator associates to the right, and that * has precedence over ->.
*)

(*
f1 : int -> bool
f2 : bool -> int
f3 : int -> (int * bool)
f4 : (int * bool) -> int
f5 : int -> (int -> int)
f6 : int -> (int -> bool)
f7 : bool -> (int -> bool)
f8 : bool -> (bool -> int)
f9 : bool -> (int -> int)
f10 : (int -> int) -> int
f11 : (int -> bool) -> int
f12 : (bool -> int) -> int
f13 : (int -> bool) -> bool
f14 : (bool -> bool) -> int
f15 : int -> (int * int) -> int
f16 : int -> (int -> (int -> int))
f17 : (int -> int) -> (int -> int)
f18 : ((int -> int) -> int) -> int
f19 : (int -> int) -> (bool -> bool)
f20 : (int -> bool) -> (bool -> int)
*)

(* FUNZIONI CUSTOM CREATE DA ME
f21 : int -> (int -> int) -> int
*)

(* f1 : int -> bool *)
let f1 i = i > 0

(* f2 : bool -> int *)
let f2 b = if b then 1 else 0

(* f3 : int -> (int * bool) *)
let f3 a = a+1, true

(* f4 : (int * bool) -> int *)
let f4 (i,b) = if b then i+1 else i-1

(* f5 : int -> (int -> int) *)
let f5 a = fun b -> a+b

(* f6 : int -> (int -> bool) *)
let f6 a = fun b -> a+b>0

(* f7 : bool -> (int -> bool) *)
let f7 b = fun i -> if b then i+1>i else i+1<i
let f7_2 b = fun i -> if b then i>0 else i<0
let f7_3 b = fun i -> i=0 || b

(* f8 : bool -> (bool -> int) *)
let f8 a = fun b -> if a||b then 1 else 0

(* f9 : bool -> (int -> int) *)
let f9 b = fun i -> if b then i else i+1

(* f10 : (int -> int) -> int *)
let f10 x y = x+y

(* f11 : (int -> bool) -> int *)
let f11 i b = if b then i+1 else i

(* f12 : (bool -> int) -> int *)
let f12 b i = if b then i+1 else i

(* f13 : (int -> bool) -> bool *)
let f13 i b = i>0 || b

(* f14 : (bool -> bool) -> int *)
let f14 a b = if a||b then 1 else 0

(* f15 : int -> (int * int) -> int *)
let f15 i1 (i2,i3) = i1+i2+i3

(* f16 : int -> (int -> (int -> int)) *)
let f16 i1 =
	fun i2 ->
		fun i3 -> i1+i2+i3

(* f17 : (int -> int) -> (int -> int) *)
let f17 i1 i2 = fun i3 -> i1+i2+i3

(* f18 : ((int -> int) -> int) -> int *)
let f18 i1 i2 i3 = i1+i2+i3

(* f19 : (int -> int) -> (bool -> bool) *)
let f19 i1 i2 = fun b -> b||i1+i2>0

(* f20 : (int -> bool) -> (bool -> int) *)
let f20 i1 b1 =
	fun b2 -> if b1||b2 then i1+1 else i1+0

;;