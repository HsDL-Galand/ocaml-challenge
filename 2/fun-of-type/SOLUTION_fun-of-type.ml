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

(* f5   : int -> (int -> int) *)
(* f5_2 : int ->  int -> int  *)
let f5 a = fun b -> a+b
let f5_2 a b = a+b

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
let f10 x y = x+y (*NON CHIEDEVA QUESTO*)
let f10_2 f = (f 3) + 1

(* f11 : (int -> bool) -> int *)
let f11 i b = if b then i+1 else i (*NON CHIEDEVA QUESTO*)
let f11_2 f = if (f 3) then 1 else 0

(* f12 : (bool -> int) -> int *)
let f12 b i = if b then i+1 else i (*NON CHIEDEVA QUESTO*)
let f12_2 f = (f true) + 1

(* f13 : (int -> bool) -> bool *)
let f13 i b = i>0 || b (*NON CHIEDEVA QUESTO*)
let f13_2 f = (f 3)>true

(* f14 : (bool -> bool) -> int *)
let f14 a b = if a||b then 1 else 0 (*NON CHIEDEVA QUESTO*)
let f14_2 f = if (f true) then 1 else 0

(* f15 : int -> (int * int) -> int *)
let f15 i1 (i2,i3) = i1+i2+i3

(* f16 : int -> (int -> (int -> int)) *)
let f16 i1 =
	fun i2 ->
		fun i3 -> i1+i2+i3

(* f17 : (int -> int) -> (int -> int) *)
let f17 i1 i2 = fun i3 -> i1+i2+i3 (*NON CHIEDEVA QUESTO*)
let f17_2 f = (f 3) + 1
let f17_3 f = fun x -> f(x+1)+1 (* GIUSTA *)
let f17_4 f = fun x -> 3
(* let f17_5 f = fun ((f 3) + 1) -> 3 ERRORE *)

(* f18 : ((int -> int) -> int) -> int *)
	let f18 i1 i2 i3 = i1+i2+i3 (*NON CHIEDEVA QUESTO*)
	let f18_2 f =
		fun g ->
			fun x -> f+g+x
	let f18_3 f g = g((f true)+.1.)>1
	let f18_4 f = ((f true) + 1)
	(* (int -> int) (2 + 1) *)
	(* (int) 3 *)


	(* j0 : int *)
	let j0 = 1
	(* j1 : int -> int *)
	let j1 i = i+1
	let j1_2 = fun i -> i+1
	(* j10 : (int -> int) -> int *)
	let j10 f = (f 1) + 1

	(* j18 : ((int -> int) -> int) -> int *)
	(*
	INP: funzione f
			Inp: funzione Inp:int Out:int
			Out int
	OUT: int
	*)
	let j18 f = fun g -> (f true)+g;;
	(* No, deve restituire un int, non una funzione *)
(* let j18 f = (f (fun f)) + 1 *)
	let j18_2 f = f (fun i -> i+3) + 1;;
	let j18_3 f = (f (fun i -> i+3)) + 1;;

	(* f39 : (((int -> int) -> int) -> int) -> int *)
	let f39 f = f( fun g -> g(3) + 2 ) + 1
	(* let f39 f = (f (fun (fun k -> k+1) -> i+3)) + 1;; TENTATIVO ERRATO *)

	(* f40 : ((((int -> int) -> int) -> int) -> int) -> int *)
	let f40 f = f( fun g -> g( fun h -> h + 3) + 2) + 1
	(* f41 : (((((int -> int) -> int) -> int) -> int) -> int) -> int *)
	let f41 f = f( fun g -> g( fun h -> h(4) + 3) + 2) + 1

	(* f29 : (int -> int -> int) -> int  *) (*INP: funzione con 2Inp int e 1Out int; OUT: int*)
	let j29 f = (f 1 2)+1


(* f19 : (int -> int) -> (bool -> bool) *)
let f19 i1 i2 = fun b -> b||i1+i2>0 (*NON CHIEDEVA QUESTO*)
let f19_2 f = fun b -> if b then (f 1)>0 else false
(* Questa dovrebbe essere giusta, perchè chiamando f19_2 passando una funzione (es: let foo x = 1) fa vedere - : bool -> bool*)

(* f20 : (int -> bool) -> (bool -> int) *)
let f20 i1 b1 =
	fun b2 -> if b1||b2 then i1+1 else i1+0 (*NON CHIEDEVA QUESTO*)
let f20_2 f = fun b -> if (f 3)||b then 1 else 0


(* PROVANDO A FAR COMPARIRE LE PARENTESI *)
(* f10 : (int -> int) -> int *)
(* let f10_2 f = 3 *)

;;