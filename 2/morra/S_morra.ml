(*
Morra
Consider the type:

type winner = Player | Computer | Tie ;;
Write a function with type:

win : int * int -> (int * int) * winner
which determines the winner of a round of the Morra game.
The parameters (hp,gp) in a function call win (hp,gp) represent, respectively, the hand and the guess of the player.
The function randomly generates another pair of numbers:

hc, representing the hand of the computer (in the range 0..5);
gc, representing the guess of the computer (in the range 0..10);
The winner is determined as follows:

if the guess of the player equals the sum of the two hands, but that of the computer does not, then the winner is the player;
otherwise, if the computer guesses the sum of the two hands, then the winner is the computer;
otherwise, there is a tie.
Besides the winner, the returned value must return the hand and the guess of the computer. For example:

win(2,5);;
- : (int * int) * winner = ((0, 1), Tie)

win(2,5);;
- : (int * int) * winner = ((4, 6), Computer)

win(2,5);;
- : (int * int) * winner = ((3, 4), Player)
*)

type winner = Player | Computer | Tie ;;

let win (hp,gp) = 
	let hc = Random.int(6) in
	let gc = Random.int(11) in
	let calculate player computer = match player, computer with
		| (hp,gp), (hc,gc) when (hp+hc=gp && gp<>gc) -> ((hc, gc), Player)	(* CASO 1: Player Win (hp+hc=gp && gp<>gc)*)
		| (hp,gp), (hc,gc) when (hp+hc=gc && gp<>gc) -> ((hc, gc), Computer)(* CASO 2: Computer Win *)
		| _ -> ((hc, gc), Tie)	(* CASO 3: Tie *)
	in
	calculate (hp,gp) (hc,gc)

(********************************************************** \/ GEMINI \/ **********************************************************)

let win (hp, gp) =
  let hc = Random.int 6 in
  let gc = Random.int 11 in
  let sum = hp + hc in
  let winner =
    if gp = sum && gc <> sum then Player
    else if gc = sum then Computer
    else Tie
  in ((hc, gc), winner)