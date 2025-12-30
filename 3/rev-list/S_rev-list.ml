(*
Reverse a list
Write a function to reverse the the elements of a list, with the following type:

rev : 'a list -> 'a list
For example:

rev [1;2;3;4;5] ;;
- : int list = [5; 4; 3; 2; 1]
Hint: recall the operator @ that concatenates two lists:

[1;2;3] @ [4;5] 
- : int list = [1; 2; 3; 4; 5]
Bonus: make rev tail-recursive.
*)

let rec rev1 l = match l with
	| [] -> []
	| h::t -> (rev1 t)@[h]

let rev2 l =
	let rec aux x acc = match x with
		| [] -> acc
		| h::t -> aux t (h::acc)
	in
	aux l []

(*
[3;6;8]
[3]
[6,3]
[8,6,3]
prendi il primo elemento, aggiungilo ad una lista, ripeti passando la lista iniziale senza la testa
*)

;;
assert(rev1 [] = []);;
assert(rev1 [1;2;3;4;5] = [5;4;3;2;1]);;
assert(rev2 [] = []);;
assert(rev2 [1;2;3;4;5] = [5;4;3;2;1]);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let rev l =
  let rec aux acc = function
    | [] -> acc
    | h :: t -> aux (h :: acc) t
  in aux [] l

;;
assert(rev [] = []);;
assert(rev [1;2;3;4;5] = [5;4;3;2;1]);;