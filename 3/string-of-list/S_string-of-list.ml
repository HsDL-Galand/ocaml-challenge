(*
From list to string
Recall the ^ operator to concatenate strings:

# "ping" ^ "pong";;
- : string = "pingpong"
Write a function with the following type:

string_of_list : int list -> string
such that string_of_list l evaluates to a string representation of the list of integers l.

For instance, we must obtain:

# string_of_list [];;
- : string = "[]"

# string_of_list [1];;
- : string = "[1]"

# string_of_list [1;2;3];;
- : string = "[1;2;3]"
*)

let string_of_list1 l =
	let rec aux acc x = match x with
		| [] -> acc
		| h::t -> aux (acc ^ (string_of_int h)) (t)
	in
	aux "" l

let rec string_of_list2 l = match l with
	| [] -> ""
	| h::t -> (string_of_int h) ^ (string_of_list2 t)

;;
assert(string_of_list1 [] = "");;
assert(string_of_list2 [] = "");;
assert(string_of_list1 [1] = "1");;
assert(string_of_list2 [1] = "1");;
assert(string_of_list1 [1;2;3] = "123");;
assert(string_of_list2 [1;2;3] = "123");;

let string_of_list3 l =
	let rec aux acc x = match x with
		| [] -> acc
		| h::t when (l = x) -> aux (acc ^ (string_of_int h)) (t)
		| h::t -> aux (acc ^ ";" ^ (string_of_int h)) (t)
	in
	"[" ^ (aux "" l) ^ "]"

let rec string_of_listFAIL l = match l with
	| [] -> ""
	| h::t when (h::t = l) -> "[" ^ (string_of_int h) ^ (string_of_listFAIL t)
	| h::t -> (string_of_int h) ^ (string_of_listFAIL t)

let string_of_list4 l =
	let rec aux l = match l with
		| [] -> ""
		| [x] -> string_of_int x (* Caso base: ultimo elemento, niente ; *)
		| h::t -> (string_of_int h) ^ ";" ^ (aux t) (* Caso ricorsivo: elemento + ; + resto *)
	in
	"[" ^ (aux l) ^ "]"

;;
assert(string_of_list3 [] = "[]");;
assert(string_of_list3 [1] = "[1]");;
assert(string_of_list3 [1;2;3] = "[1;2;3]");;
assert(string_of_list4 [] = "[]");;
assert(string_of_list4 [1] = "[1]");;
assert(string_of_list4 [1;2;3] = "[1;2;3]");;

(*
[2;4;8]
""^2
acc^4
*)

(********************************************************** \/ GEMINI \/ **********************************************************)

let string_of_list l =
  let rec aux = function
    | [] -> ""
    | [x] -> string_of_int x
    | h :: t -> string_of_int h ^ ";" ^ aux t
  in "[" ^ aux l ^ "]"

;;
assert (string_of_list [] = "[]");;
assert (string_of_list [1] = "[1]");;
assert (string_of_list [1; 2; 3] = "[1;2;3]");;
assert (string_of_list [-1; 0; 100] = "[-1;0;100]");;

(* Test aggiuntivi per le tue soluzioni *)
assert (string_of_list3 [10; 20; 30] = "[10;20;30]");;
assert (string_of_list4 [5; -5] = "[5;-5]");;