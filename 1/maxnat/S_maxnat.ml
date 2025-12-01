(*
# Max of two natural numbers

Write a function with the following type:
max_nat : int -> int -> int

such that ``max_nat a b`` evaluates to the maximum between ``a`` and ``b``,
if they are both *natural* numbers (i.e., greater than or equal to 0).
If not, the function must fail.

To make a function fail, use the `failwith` construct. For example:
let always_fail x = failwith("This function always fails")

The following tests must pass:
assert(max_nat 2 5 = 5);;
assert(max_nat 5 2 = 5);;
assert(try max_nat (-2) 5 |> fun _ -> false with _ -> true);;
assert(try max_nat 2 (-5) |> fun _ -> false with _ -> true);;
assert(try max_nat (-2) (-5) |> fun _ -> false with _ -> true);;

**Warning**: do not even think of using the built-in ``max`` function.
*)

let max_nat a b =
	(*if not(a>=0 && b>=0) then*)
	if a<0 || b<0 then
		failwith("Both inputs must be natural numbers")
	else
		if a > b then
			a
		else
			b


let max_nat2 a b =
	if (a < 0 || b < 0)
		then failwith("Error they both need to be natural numbers")
	else if (a > b)
		then a
		else b

;;
assert(max_nat 2 5 = 5);;
assert(max_nat 5 2 = 5);;
assert(try max_nat (-2) 5 |> fun _ -> false with _ -> true);;
assert(try max_nat 2 (-5) |> fun _ -> false with _ -> true);;
assert(try max_nat (-2) (-5) |> fun _ -> false with _ -> true);;

assert(max_nat2 2 5 = 5);;
assert(max_nat2 5 2 = 5);;
assert(try max_nat2 (-2) 5 |> fun _ -> false with _ -> true);;
assert(try max_nat2 2 (-5) |> fun _ -> false with _ -> true);;
assert(try max_nat2 (-2) (-5) |> fun _ -> false with _ -> true);;