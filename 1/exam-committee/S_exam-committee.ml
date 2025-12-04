(*
Exam Committee
You are tasked with writing a function that determines whether an exam candidate passes or fails based on the votes of a three-member committee. Each committee member can vote using one of four possible values:

StrongReject
WeakReject
WeakAccept
StrongAccept
The exam is passed if at least two committee members support acceptance (either weakly or strongly), unless the third member gives a strong reject, in which case the candidate fails.

Write a function with type:

decide_exam : vote -> vote -> vote -> bool
that takes as input three votes and returns a bool indicating whether the candidate passes (true) or fails (false).
*)

type vote = StrongReject | WeakReject | WeakAccept | StrongAccept

(* let decide_exam (vote : vote) (vote : vote) (vote : vote) : bool = true *)
let decide_exam vote1 vote2 vote3 =
	if vote1 = StrongReject || vote2 = StrongReject || vote3 = StrongReject then
		false
	else if (vote1 = StrongAccept || vote1 = WeakAccept) && (vote2 = StrongAccept || vote2 = WeakAccept) ||
			(vote2 = StrongAccept || vote2 = WeakAccept) && (vote3 = StrongAccept || vote3 = WeakAccept) ||
			(vote1 = StrongAccept || vote1 = WeakAccept) && (vote3 = StrongAccept || vote3 = WeakAccept) then
		true
	else
		false

;;

let decide_exam2 vote1 vote2 vote3 = match vote1, vote2, vote3 with
	| _ when (vote1 = StrongReject || vote2 = StrongReject || vote3 = StrongReject) -> false
	| _ when (	((vote1 = StrongAccept || vote1 = WeakAccept)   &&   (vote2 = StrongAccept || vote2 = WeakAccept))	||
				((vote2 = StrongAccept || vote2 = WeakAccept)   &&   (vote3 = StrongAccept || vote3 = WeakAccept))	||
				((vote1 = StrongAccept || vote1 = WeakAccept)   &&   (vote3 = StrongAccept || vote3 = WeakAccept))	) -> true
	| _ -> false
;;

(*
_ v1 || v2 || v3 = StrongReject -> false
v1 = SA || v1 WA   && v2 = SA || v2 WA     ||
v2 = SA || v2 WA   && v3 = SA || v3 WA     ||
v1 = SA || v1 WA   && v3 = SA || v3 WA     -> true
_ -> false
*)

assert(decide_exam StrongAccept StrongAccept StrongAccept = true);;
assert(decide_exam WeakAccept WeakAccept WeakAccept = true);;
assert(decide_exam WeakReject WeakReject WeakReject = false);;
assert(decide_exam StrongReject StrongReject StrongReject = false);;

assert(decide_exam StrongAccept StrongAccept WeakAccept = true);;
assert(decide_exam StrongAccept StrongAccept WeakReject = true);;
assert(decide_exam StrongAccept StrongAccept StrongReject = false);;
assert(decide_exam StrongAccept WeakReject WeakReject = false);;


assert(decide_exam2 StrongAccept StrongAccept StrongAccept = true);;
assert(decide_exam2 WeakAccept WeakAccept WeakAccept = true);;
assert(decide_exam2 WeakReject WeakReject WeakReject = false);;
assert(decide_exam2 StrongReject StrongReject StrongReject = false);;

assert(decide_exam2 StrongAccept StrongAccept WeakAccept = true);;
assert(decide_exam2 StrongAccept StrongAccept WeakReject = true);;
assert(decide_exam2 StrongAccept StrongAccept StrongReject = false);;
assert(decide_exam2 StrongAccept WeakReject WeakReject = false);;