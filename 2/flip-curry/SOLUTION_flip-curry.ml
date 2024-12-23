(*
Flip arguments in curried functions
Write a function flip that takes as input a function f in curried form and returns a new function that works as f but takes its arguments in the opposite order.

The function must have the following type:

flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c
Here are some unit tests:

let sub x y = x - y;;
let flipped_sub = flip sub;;
assert (flipped_sub 3 10 = 7);;
assert (flipped_sub 10 3 = -7);;
*)

(* flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c *)
let flip f x y = f y x 
(* f: 'a -> ('b -> 'c) *)
(* flip: ('a -> 'b -> 'c)   ->   'b -> 'a -> 'c*)

let sub x y = x - y;;
let flipped_sub = flip sub;;
assert (flipped_sub 3 10 = 7);;
assert (flipped_sub 10 3 = -7);;



(*
Flip arguments in curried functions
Write a function flip that takes as input a function f in curried form and returns a new function that works as f but takes its arguments in the opposite order.

The function must have the following type:

flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c
Here are some unit tests:

let sub x y = x - y;;
let flipped_sub = flip sub;;
assert (flipped_sub 3 10 = 7);;
assert (flipped_sub 10 3 = -7);;
*)

(* flip_10 : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c *)
let flip_10 f a b = f b a

let sub_10 x y = x - y;;
let flipped_sub_10 = flip_10 sub_10;;
assert (flipped_sub_10 3 10 = 7);;
assert (flipped_sub_10 10 3 = -7);;