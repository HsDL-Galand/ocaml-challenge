(*
Nested tuples
Consider a tuple (name, (written, oral)) representing a student's exam results, where:
	name is a string (the student's name),
	written and oral are integers (the grades of the written and oral parts of the exam).

Write a function
	total_score : (string * (int * int)) -> int
	that returns the sum of the written and oral grades.

Write a function:
	passed : (string * (int * int)) -> bool
	that returns true if both grades are at least 18, and false otherwise.

Write a function:
	string_of_result : (string * (int * int)) -> string
	that returns a string of the form "Alice passed with total 45" or "Bob did not pass", depending on the student’s grades. You can use the string concatenation operator ^ in this function. For example:

"Hello, " ^ "world!" ;;
- : string = "Hello, world!"
Write a function:

merge : (string * (int * int)) -> (string * (int * int)) -> (string * (int * int))
that, given two results of the same student, returns a new result with the maximum grades between the two results. For example:

merge ("Anna",(7,15)) ("Anna",(4,18));;
- (string * (int * int)) = ("Anna",(7,18))
The function must fail if the two inputs are not results of the same student.

Write unit tests for your functions, using the assert statement.
*)
let max (x : int) (y : int) = if (x > y) then x else y (* funzione ausiliaria per calcolare velocemente il massimo tra due numeri *)

let total_score ((name : string), (written, oral)) = written + oral
let passed ((name : string), (written, oral)) = (written >= 18 && oral >= 18)
let string_of_result ((name), (written, oral)) =
	if (passed (name, (written, oral)))
		then name ^ " passed with total " ^ string_of_int (total_score (name, (written, oral)))
		else name ^ " did not pass"
let merge ((name1 : string), (written1, oral1)) ((name2 : string), (written2, oral2)) =
	if (name1 = name2)
		then (name1, (max written1 written2, max oral1 oral2))
		else failwith("ERR1") (* Caso nomi diversi *)

;;
assert(total_score ("AAA", (20, 20)) = 40);;
assert(passed ("BBB", (20, 20)) = true);;
assert(passed ("CCC", (10, 10)) = false);;
assert(passed ("DDD", (18, 10)) = false);;
assert(passed ("EEE", (10, 18)) = false);;
assert(passed ("FFF", (18, 18)) = true);;
assert(string_of_result ("GGG", (20, 20)) = "GGG passed with total 40");;
assert(string_of_result ("HHH", (10, 10)) = "HHH did not pass");;
assert(merge ("III", (10, 30)) ("III", (15, 25)) = ("III", (15, 30)));;
assert(merge ("JJJ", (30, 10)) ("JJJ", (25, 15)) = ("JJJ", (30, 15)));;
assert (try let _ = merge ("KKK", (30, 10)) ("LLL", (25, 15)) in false with Failure "ERR1" -> true);;

(***************************** \/ GEMINI \/ *****************************)

(* Utilizzo il pattern matching direttamente nei parametri per estrarre i valori *)
let total_score (_, (written, oral)) = written + oral

let passed (_, (written, oral)) = written >= 18 && oral >= 18

let string_of_result (name, scores) =
  if passed (name, scores) then
    name ^ " passed with total " ^ string_of_int (total_score (name, scores))
  else
    name ^ " did not pass"

let merge (name1, (w1, o1)) (name2, (w2, o2)) =
  if name1 <> name2 then failwith "Student names do not match"
  else (name1, (max w1 w2, max o1 o2)) (* max è una funzione standard di OCaml *)

(* Assert Tests *)
let () =
  assert (total_score ("Alice", (20, 20)) = 40);
  assert (passed ("Bob", (17, 20)) = false);
  assert (passed ("Charlie", (18, 18)) = true);
  assert (string_of_result ("Alice", (20, 20)) = "Alice passed with total 40");
  assert (merge ("Alice", (10, 20)) ("Alice", (20, 10)) = ("Alice", (20, 20)))