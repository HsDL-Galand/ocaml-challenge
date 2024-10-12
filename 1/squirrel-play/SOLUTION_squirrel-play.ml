(*
# Squirrel play

Scrat the squirrel spend most of the day playing.
In particular, Scrat plays if the temperature is between 15 and 30 degrees (inclusive).
Only in summer, the upper limit is 35 instead of 30.

Given the type:
type season = Spring | Summer | Autumn | Winter

write a function with type:
squirrel_play : int -> season -> bool

that returns true if Scrat is playing, and false otherwise.

For instance, the following asserts must pass:
assert(squirrel_play 18 Winter = true);;
assert(squirrel_play 32 Spring = false);;
assert(squirrel_play 32 Summer = true);;
*)

type season = Spring | Summer | Autumn | Winter

(*let squirrel_play (temperature : int) (season : season) : bool = ...*)
let squirrel_play temperature season =
	if temperature >= 15 && temperature <= 30 then
		true
	else
		if temperature >= 15 && temperature <= 35 && season = Summer then
			true
		else
			false

let squirrel_play2 temperature season =
	if temperature >= 15 && temperature <= 30 then
		true
	else if temperature >= 15 && temperature <= 35 && season = Summer then
		true
	else
		false

;;
assert(squirrel_play 18 Winter = true);;
assert(squirrel_play 32 Spring = false);;
assert(squirrel_play 32 Summer = true);;

assert(squirrel_play 10 Spring = false);;
assert(squirrel_play 15 Spring = true);;
assert(squirrel_play 20 Spring = true);;
assert(squirrel_play 30 Spring = true);;
assert(squirrel_play 40 Spring = false);;

assert(squirrel_play 10 Summer = false);;
assert(squirrel_play 15 Summer = true);;
assert(squirrel_play 20 Summer = true);;
assert(squirrel_play 30 Summer = true);;
assert(squirrel_play 40 Summer = false);;

assert(squirrel_play 10 Autumn = false);;
assert(squirrel_play 15 Autumn = true);;
assert(squirrel_play 20 Autumn = true);;
assert(squirrel_play 30 Autumn = true);;
assert(squirrel_play 40 Autumn = false);;

assert(squirrel_play 10 Winter = false);;
assert(squirrel_play 15 Winter = true);;
assert(squirrel_play 20 Winter = true);;
assert(squirrel_play 30 Winter = true);;
assert(squirrel_play 40 Winter = false);;

assert(squirrel_play 33 Spring = false);;
assert(squirrel_play 33 Summer = true);;
assert(squirrel_play 33 Autumn = false);;
assert(squirrel_play 33 Winter = false);;