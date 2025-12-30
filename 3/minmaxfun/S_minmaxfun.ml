(*
Min and max of a function
Recall the built-in option type:

type 'a option = Some of 'a | None
Write a function with the following type:

minmaxfun : (int -> 'a) -> int -> int -> ('a * 'a) option
such that minmaxfun f a b computes the minimum and the maximum of f in the range [a,b].
If the range is empty, then the function evaluates to None.

Your function must pass the following unit tests:

assert (minmaxfun (fun x -> x) (-2) 5 = Some (-2,5));;
assert (minmaxfun (fun x -> x) 5 (-2) = None);;
assert (minmaxfun (fun x -> x) 5 5 = Some (5,5));;
assert (minmaxfun (fun x -> x * x) (-2) 5 = Some (0,25));;

let curve x = x |> Float.of_int |> fun x -> x ** 3.0 -. 3.0 *. x;;
let arccos x = x |> Float.of_int |> Float.acos;;

assert (minmaxfun curve (-2) 2 = Some (-2.0,2.0));;
assert (minmaxfun arccos (-1) 1 = Some (0., Float.pi));;
*)

type 'a option = Some of 'a | None

let minmaxfun f a b =
	let rec aux x acc =
		if		(x > b)
			then Some acc	(* Caso base: fine range *)
		else if	(f x < fst(acc))
			then aux (x+1) (f x, snd(acc))	(* Caso nuovo min *)
		else if	(f x > snd(acc))
			then aux (x+1) (fst(acc), f x)	(* Caso nuovo max *)
			else aux (x+1) acc
	in
	if	(a > b)
		then None	(* Caso range vuoto *)
		else aux a (f a, f a)

(*
f 3 5
f 3 -> (3,3)
f 4 -> (3,4)
f 5 -> (3,5)
a ogni giro aggiorna min max acc = (min, max)
*)

;;
assert (minmaxfun (fun x -> x) (-2) 5 = Some (-2,5));;
assert (minmaxfun (fun x -> x) 5 (-2) = None);;
assert (minmaxfun (fun x -> x) 5 5 = Some (5,5));;
assert (minmaxfun (fun x -> x * x) (-2) 5 = Some (0,25));;

let curve x = x |> Float.of_int |> fun x -> x ** 3.0 -. 3.0 *. x;;
let arccos x = x |> Float.of_int |> Float.acos;;

assert (minmaxfun curve (-2) 2 = Some (-2.0,2.0));;
assert (minmaxfun arccos (-1) 1 = Some (0., Float.pi));;

(********************************************************** \/ GEMINI \/ **********************************************************)

let minmaxfun f a b =
  if a > b then None
  else
    let rec loop x min_v max_v =
      if x > b then Some (min_v, max_v)
      else
        let y = f x in
        loop (x + 1) (if y < min_v then y else min_v) (if y > max_v then y else max_v)
    in
    let start = f a in
    loop (a + 1) start start