(*
Movie ratings
Write a function of type:

movie_rating : int -> int -> int -> string
that takes the ratings of three critics for a movie (on a scale from 1 to 5) and returns a string indicating the overall rating:

If all three critics give a rating of 5, return "Masterpiece".
If two critics give a rating of 5 and the third gives at least a 4, return "Highly Recommended".
If two critics give a rating of at least 4 and the third gives at least a 3, return "Recommended".
Otherwise, return "Mixed Reviews".
The function must fail with an error if any of the inputs are not in the expected range.
*)

(* let movie_rating (rating1 : int) (rating2 : int) (rating3 : int) : string = "true" *)
let movie_rating2 rating1 rating2 rating3 =
	if (rating1<1 || rating1>5) || (rating2<1 || rating2>5) || (rating3<1 || rating3>5) then
		failwith "Value out of range"
	else if (rating1 + rating2 + rating3) >= 14 then
		"Highly Recommended"
	else if ((rating1 + rating2 + rating3) >= 11) &&
			((rating1  = 4) || (rating2  = 4) || (rating3  = 4)) &&
			((rating1 != 2) || (rating2 != 2) || (rating3 != 2)) then
		"Recommended"
	else
		"Mixed Reviews"

let movie_rating3 rating1 rating2 rating3 =
	if (rating1<1 || rating1>5) || (rating2<1 || rating2>5) || (rating3<1 || rating3>5) then
		failwith "Value out of range"
	else if (rating1 + rating2 + rating3) >= 14 then
		"Highly Recommended"
	else if ((rating1 + rating2 + rating3) >= 11) &&
			((rating1  = 4) || (rating2  = 4) || (rating3  = 4)) &&
			((rating1 != 2) || (rating2 != 2) || (rating3 != 2)) then
		"Recommended"
	else
		"Mixed Reviews"

let movie_rating rating1 rating2 rating3 =
	if (rating1<1 || rating1>5) || (rating2<1 || rating2>5) || (rating3<1 || rating3>5) then
		failwith "Value out of range"
	else if (rating1 = 5 && rating2 = 5 && rating3 = 5) then
		"Masterpiece"
	else if (rating1 + rating2 + rating3) >= 14 then
		"Highly Recommended"
	else if ((rating1 + rating2 + rating3) >= 11) &&
			(rating1 >= 3 && rating2 >= 3 && rating3 >= 3) &&
			(rating1>=4 && rating2>=4) || (rating1>=4 && rating3>=4) || (rating2>=4 && rating3>=4) then
		"Recommended"
	else
		"Mixed Reviews"


;;
assert(movie_rating 5 5 5 = "Masterpiece");;	(*15*)
assert(movie_rating 5 5 4 = "Highly Recommended");;	(*14*)
assert(movie_rating 5 5 3 = "Recommended");;	(*13*) (*tutti >= 3*)
assert(movie_rating 5 5 2 = "Mixed Reviews");;	(*12*) (*NON tutti >= 3*)
assert(movie_rating 5 5 1 = "Mixed Reviews");;	(*11*) (*NON tutti >= 3*)

assert(movie_rating 5 4 4 = "Recommended");;	(*13*) (*tutti >= 3*)
assert(movie_rating 5 4 3 = "Recommended");;	(*12*) (*tutti >= 3*)
assert(movie_rating 5 4 2 = "Mixed Reviews");;	(*11*) (*NON tutti >= 3*)
assert(movie_rating 5 4 1 = "Mixed Reviews");;	(*10*)

assert(movie_rating 5 3 3 = "Mixed Reviews");;	(*11*) (*ECCEZIONE: almeno due numeri devono essere >= 4*)
assert(movie_rating 5 3 2 = "Mixed Reviews");;
assert(movie_rating 5 3 1 = "Mixed Reviews");;

assert(movie_rating 5 2 2 = "Mixed Reviews");;	(*9*)
assert(movie_rating 5 2 1 = "Mixed Reviews");;

assert(movie_rating 5 1 1 = "Mixed Reviews");;	(*7*)

assert(movie_rating 4 4 4 = "Recommended");;	(*12*) (*tutti sopra 3*)
assert(movie_rating 4 4 3 = "Recommended");;	(*11*) (*tutti sopra 3*)
assert(movie_rating 4 4 2 = "Mixed Reviews");;	(*v*)
assert(movie_rating 4 4 1 = "Mixed Reviews");;

assert(movie_rating 4 3 3 = "Mixed Reviews");;	(*10*)
assert(movie_rating 4 3 2 = "Mixed Reviews");;
assert(movie_rating 4 3 1 = "Mixed Reviews");;

assert(movie_rating 4 2 2 = "Mixed Reviews");;
assert(movie_rating 4 2 1 = "Mixed Reviews");;

assert(movie_rating 4 1 1 = "Mixed Reviews");;

assert(movie_rating 3 3 3 = "Mixed Reviews");;	(*9*)
assert(movie_rating 3 3 2 = "Mixed Reviews");;
assert(movie_rating 3 3 1 = "Mixed Reviews");;

assert(movie_rating 3 2 2 = "Mixed Reviews");;
assert(movie_rating 3 2 1 = "Mixed Reviews");;

assert(movie_rating 2 2 2 = "Mixed Reviews");;
assert(movie_rating 2 2 1 = "Mixed Reviews");;

assert(movie_rating 2 1 1 = "Mixed Reviews");;

assert(movie_rating 1 1 1 = "Mixed Reviews");;

(* assert(movie_rating 0 3 3 = "Value out of range");; *)
(* assert(decide_exam WeakAccept WeakAccept WeakAccept = true);; *)

(* assert(movie_rating 4 4 5 = "Recommended");;	13 *)