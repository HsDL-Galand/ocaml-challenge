(*
Has One
Write a function with type:

has_one : int -> bool
For a positive integer n, has_one n returns true if n contains a 1 digit. If n is negative, then the function must fail.

Here are some unit tests:

assert(has_one 10 = true);;
assert(has_one 220 = false);;
assert(has_one 911 = true);;
assert(has_one 451 = true);;
assert(try has_one (-1) |> fun _ -> false with _ -> true);;
*)

let has_one n =
	let rec aux x acc = match x, acc with
		| 0, _ -> false (* Caso base: si è arrivati all'ultima cifra *)
		| _ -> if (x mod acc = 1) then true else aux (x / acc) acc 
	in
	if	(n<0)
		then failwith("ERR1")
		else aux n 10

let has_one2 n =
	let rec aux x = match x with
		| 0 -> false (* Caso base: si è arrivati all'ultima cifra *)
		| _ -> if (x mod 10 = 1) then true else aux (x / 10)
	in
	if	(n<0)
		then failwith("ERR1")
		else aux n

(*
312 mod 10 = 2
312 / mod 10 = 31
3 mod 10 = 3
3 / 10 = 0
*)
;;
assert(has_one 10 = true);;
assert(has_one 220 = false);;
assert(has_one 911 = true);;
assert(has_one 451 = true);;
assert(try has_one (-1) |> fun _ -> false with _ -> true);;

assert(has_one2 10 = true);;
assert(has_one2 220 = false);;
assert(has_one2 911 = true);;
assert(has_one2 451 = true);;
assert(try has_one2 (-1) |> fun _ -> false with _ -> true);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let has_one n =
  if n < 0 then failwith "n must be positive"
  else
    let rec search x =
      if x = 0 then false
      else if x mod 10 = 1 then true
      else search (x / 10)
    in search n