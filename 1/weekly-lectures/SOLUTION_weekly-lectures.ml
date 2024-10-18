(*
# Weekly lectures

OCaml has a convenient syntax to define enumerated types: the elements of the enumeration are listed, separated by `|`.
For example:
type weekday = Mo | Tu | We | Th | Fr

type course = ALF | LIP

The elements of the enumeration are always capitalized.

Write a function with type:
isLecture : weekday -> course -> bool

such that `isLecture d c` is true when there is a class of course `c`
in the day `d`.

The weekly calendar of lectures is the following:
- ALF: Tuesday, Thursday, Friday
- LIP: Wednesday, Thursday 
*)

(*	Mo Tu We Th Fr
ALF	-- AA -- AA AA
LIP -- -- LL LL --
*) 

type weekday = Mo | Tu | We | Th | Fr
type course = ALF | LIP

(*let isLecture (d : weekday) (c : course) : bool = match d, c with*)
let isLecture2 d c = match d, c with
	| Tu, ALF -> true
	| We, LIP -> true
	| Th, _ -> true
	| Fr, ALF -> true
	| _, _ -> false

let isLecture d c = match d, c with
	| Tu, ALF
	| We, LIP
	| Th, _
	| Fr, ALF -> true
	| _ -> false

;;
assert(isLecture Mo ALF = false);;
assert(isLecture Tu ALF = true);;
assert(isLecture We ALF = false);;
assert(isLecture Th ALF = true);;
assert(isLecture Fr ALF = true);;

assert(isLecture Mo LIP = false);;
assert(isLecture Tu LIP = false);;
assert(isLecture We LIP = true);;
assert(isLecture Th LIP = true);;
assert(isLecture Fr LIP = false);;