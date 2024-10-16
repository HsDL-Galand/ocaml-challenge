(*
Scrivere, usando il pattern matching, una funzione OCaml con tipo:

val nand : bool -> bool -> bool = <fun>
La funzione implementa il connettivo logico "nand", definito come segue:

P nand Q = !(P && Q)

Fatto questo, individuare quali dei seguenti test passano.
*)

(* let nand (a : bool) (b : bool) : bool = true *)
let nand1 a b = not(a && b)

let nand a b = match a, b with
	| true, true -> false
	| _ -> true

;;
assert(nand(not((true&&true)))(nand(not(false))(nand(false)(true))));;
assert(nand((not(nand(false)(false))&&(not(false)&&(false&&false))))(not(((false&&true)&&not(false)))));;
(* assert(nand(not(((nand(true)(true)||(false||true))&&(nand(false)(false)&&(true&&false)))))(not((nand(not(false))((true||false))||nand((true&&true))(nand(false)(true))))));; *)
(* assert(nand(not(((nand(not(false))(not(true))&&not((true||true)))&&(not((false&&false))&&((true&&true)||nand(true)(false))))))(nand((nand(not((true||false)))(((true||false)||(false&&false)))&&(((true||false)&&(true&&false))||not(nand(true)(false)))))(not(nand(not(nand(true)(false)))(not(not(false)))))));; *)
assert(nand(not(((nand((false&&true))((true&&false))||not(nand(true)(false))))||((not((true&&true))||nand((true&&false))((true||false)))||((not(false)||(false&&true))||(not(true)||not(true))))))(not(nand(not(nand(not(not(true)))(nand(nand(false)(true))((false&&false)))))(nand((nand(not(true))(nand(true)(true))||(nand(true)(true)&&(false&&true))))((nand((false&&true))(nand(true)(true))||(not(true)||(true||true))))))));;

(*
a b nand
0 0 1
0 1 1
1 0 1
1 1 0
*)