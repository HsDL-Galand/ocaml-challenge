(*
Palindrome
Write a function is_palindrome that checks if a list is palindrome. A list is palindrome when it reads the same backwards as forwards.

The function must have the following type:

is_palindrome : 'a list -> bool
Here are some unit tests:

assert(is_palindrome []);;
assert(is_palindrome ['a';'n';'n';'a']);;
assert(is_palindrome ['r';'a';'d';'a';'r']);;
assert(is_palindrome ['a';'n';'n';'e'] = false);;
assert(is_palindrome ['z';'a';'n';'n';'a'] = false);;
*)

let is_palindromeTR l =
	let rec aux acc x = match x with
		| [] -> acc
		| h::t -> aux (h::acc) (t)
	in
	(aux [] l) = l

let is_palindromeFL l =
	l = List.fold_left (fun acc x -> x::acc) ([]) (l)
(* da SX prende elemento (primo) e lo inserisce in testa ad acc *)

let is_palindromeFR l =
	l = List.fold_right (fun x acc -> acc@[x]) (l) ([])
(* da DX prende elemento (ultimo) e lo accoda ad acc*)

(*
1;2;3
prendi 1 aggiungilo alla lista [1]
prendi 2 aggiunginlo ad acc [2;1]
prendi 3 aggiunginlo ad acc [3;2;1]
*)

;;
assert(is_palindromeTR []);;
assert(is_palindromeTR ['a';'n';'n';'a']);;
assert(is_palindromeTR ['r';'a';'d';'a';'r']);;
assert(is_palindromeTR ['a';'n';'n';'e'] = false);;
assert(is_palindromeTR ['z';'a';'n';'n';'a'] = false);;

assert(is_palindromeFR []);;
assert(is_palindromeFR ['a';'n';'n';'a']);;
assert(is_palindromeFR ['r';'a';'d';'a';'r']);;
assert(is_palindromeFR ['a';'n';'n';'e'] = false);;
assert(is_palindromeFR ['z';'a';'n';'n';'a'] = false);;

assert(is_palindromeFL []);;
assert(is_palindromeFL ['a';'n';'n';'a']);;
assert(is_palindromeFL ['r';'a';'d';'a';'r']);;
assert(is_palindromeFL ['a';'n';'n';'e'] = false);;
assert(is_palindromeFL ['z';'a';'n';'n';'a'] = false);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let is_palindrome l =
  l = List.rev l

;;
assert(is_palindrome []);;
assert(is_palindrome [1; 2; 3; 2; 1]);;
assert(is_palindrome [1; 2; 3] = false);;

(* 
   Risposta alla tua domanda sulla versione NON tail recursive diretta:
   È possibile farla controllando "Primo = Ultimo" e ricorrendo sul centro,
   MA è sconsigliatissimo per le liste. È inefficiente (O(n^2)) e macchinosa.
   Ecco come sarebbe (solo a scopo didattico):
*)
let rec last = function
  | [] -> failwith "Empty"
  | [x] -> x
  | _::t -> last t

let rec remove_last = function
  | [] -> []
  | [_] -> []
  | h::t -> h :: remove_last t

let rec is_palindrome_slow = function
  | [] | [_] -> true
  | h::t -> h = last t && is_palindrome_slow (remove_last t)