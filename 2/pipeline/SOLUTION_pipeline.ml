(*
Function pipe operator
Write an infix operator (|>) that behaves like the Unix pipe operator, i.e. it allows you to write function applications in a left-to-right manner.

For example, given the functions:

let double x = x * 2;;
let square x = x * x;;
the pipe operator must enojoy the following equalities:

3 |> double = double 3
3 |> double |> square = square (double 3) 
3 |> double |> square |> double = double (square (double 3)) 
The function must have the following type:

(|>) : 'a -> ('a -> 'b) -> 'b
Here are some unit tests:

let double x = x * 2;;
let square x = x * x;;

assert(3 |> double = 6);;
assert(3 |> square = 9);;
assert(3 |> square |> double = 18);;
assert(3 |> double |> square = 36);;
assert(3 |> double |> square |> double = 72);;
assert("hello" |> String.trim |> String.uppercase_ascii = "HELLO");;
*)

(* (|>) : 'a -> ('a -> 'b) -> 'b *)

let ( |> ) : 'a -> ('a -> 'b) -> 'b = fun x f -> f x

let double x = x * 2;;
let square x = x * x;;

assert(3 |> double = 6);;
assert(3 |> square = 9);;
assert(3 |> square |> double = 18);;
assert(3 |> double |> square = 36);;
assert(3 |> double |> square |> double = 72);;
assert("hello" |> String.trim |> String.uppercase_ascii = "HELLO");;

(*
Function pipe operator
Write an infix operator (|>) that behaves like the Unix pipe operator, i.e. it allows you to write function applications in a left-to-right manner.

For example, given the functions:

let double x = x * 2;;
let square x = x * x;;
the pipe operator must enojoy the following equalities:

3 |> double = double 3
3 |> double |> square = square (double 3) 
3 |> double |> square |> double = double (square (double 3)) 
The function must have the following type:

(|>) : 'a -> ('a -> 'b) -> 'b
Here are some unit tests:

let double x = x * 2;;
let square x = x * x;;

assert(3 |> double = 6);;
assert(3 |> square = 9);;
assert(3 |> square |> double = 18);;
assert(3 |> double |> square = 36);;
assert(3 |> double |> square |> double = 72);;
assert("hello" |> String.trim |> String.uppercase_ascii = "HELLO");;
*)

(* (||>) : 'a -> ('a -> 'b) -> 'b *)
let (||>) a f = f(a)

let (|||>) : 'a -> ('a -> 'b) -> 'b = fun x f -> f x

let double x = x * 2;;
let square x = x * x;;

assert(3 ||> double = 6);;
assert(3 ||> square = 9);;
assert(3 ||> square ||> double = 18);;
assert(3 ||> double ||> square = 36);;
assert(3 ||> double ||> square ||> double = 72);;
assert("hello" ||> String.trim ||> String.uppercase_ascii = "HELLO");;