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
assert(decide_exam StrongAccept StrongAccept StrongAccept = true);;
assert(decide_exam WeakAccept WeakAccept WeakAccept = true);;
assert(decide_exam WeakReject WeakReject WeakReject = false);;
assert(decide_exam StrongReject StrongReject StrongReject = false);;

assert(decide_exam StrongAccept StrongAccept WeakAccept = true);;
assert(decide_exam StrongAccept StrongAccept WeakReject = true);;
assert(decide_exam StrongAccept StrongAccept StrongReject = false);;
assert(decide_exam StrongAccept WeakReject WeakReject = false);;