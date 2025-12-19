(*
Personal data
Consider a product type person that stores the following information:

the person's name (a string),
their age (an integer),
and optionally, an email address.
type person = Person of (string * int * string option);;
Write a function:

make_person : string -> int -> string option -> person
that constructs a person value from these three pieces of information. The function must fail if the age does not fall within the range [0,150].

Write a function:

get_email : person -> string option
that extracts the email address from a person (if any).

Write a function:

can_send_adult_email : person -> bool
that returns true if the person is 18 years or older and has an email address, and false otherwise.

Here are some unit tests:

let gino = make_person "gino" 21 (Some "gino@gmail.com");;
let pino = make_person "pino" 23 None;;
let anna = make_person "anna" 16 (Some "anna@tiscali.it");;

assert(get_email gino = Some "gino@gmail.com");;
assert(get_email pino = None);;

assert(can_send_adult_email gino);;
assert(not (can_send_adult_email pino));;
assert(not (can_send_adult_email anna));;
Now, redo the exercise by using record types instead of product types:

type person = {
  name : string;
  age : int;
  email : string option;
}
Here is the minimal background that you need to use record types. A record type allows us to group several values together under named fields. It is similar to a tuple, but each component has a name, which makes the code clearer.

We define a record type with the type keyword, followed by the list of fields and their types inside braces:

type book = {
  title : string;
  pages : int;
}
To create a record, we write the field names and their values:

let b = { title = "The art of computer programming"; pages = 665 }
We can access the fields using the dot notation:

b.title     (* returns "The art of computer programming" *)
b.pages     (* returns 665 *)
*)

type person = Person of (string * int * string option);;

let is_in_range n sx dx = (n >= sx && n <= dx)

let make_person name age email =
	if (is_in_range age 0 150)
		then Person (name, age, email)
		else failwith("ERR1")	(* Valore fuori range *)

let get_email persona = match persona with
	| Person (_, _, email) -> email

let can_send_adult_email persona = match persona with
	| Person (_, age, email) -> (age >= 18 && email <> None)
let gino = make_person "gino" 21 (Some "gino@gmail.com");;
let pino = make_person "pino" 23 None;;
let anna = make_person "anna" 16 (Some "anna@tiscali.it");;

assert(get_email gino = Some "gino@gmail.com");;
assert(get_email pino = None);;

assert(can_send_adult_email gino);;
assert(not (can_send_adult_email pino));;
assert(not (can_send_adult_email anna));;

type person2 = {
	name : string;
	age : int;
	email : string option;
}

type book = {
	title : string;
	pages : int;
}
let person02 = {name = "Poldo"; age = 23; email = Some "gmail"}
let person03 = {name = "Poldo"; age = 23; email = None}

let make_person2 nome anno email =
	if (is_in_range anno 0 150)
		then {name = nome; age = anno; email = email}
		else failwith("ERR2")

let get_email2 p = p.email
(* let get_email2 p = match p with
	| email -> p.email (*superfluo*) *)

let can_send_adult_email2 persona2 = (persona2.age >= 18 && persona2.email != None)
(* let can_send_adult_email2 persona2 =
	if (persona2.age >= 18 && persona2.email != None)
		then true
		else false *)

let gino2 = make_person2 "gino2" 21 (Some "gino@gmail.com");;
let pino2 = make_person2 "pino2" 23 None;;
let anna2 = make_person2 "anna2" 16 (Some "anna@tiscali.it");;

assert(get_email2 gino2 = Some "gino@gmail.com");;
assert(get_email2 pino2 = None);;

assert(can_send_adult_email2 gino2);;
assert(not (can_send_adult_email2 pino2));;
assert(not (can_send_adult_email2 anna2));;

(********************************************************** \/ GEMINI \/ **********************************************************)

(* --- Parte 1: Tuple --- *)
type person_tuple = Person of (string * int * string option)

let make_person_tuple name age email =
  if age < 0 || age > 150 then failwith "Invalid age"
  else Person (name, age, email)

let get_email_tuple (Person (_, _, email)) = email

let can_send_adult_email_tuple (Person (_, age, email)) =
  age >= 18 && email <> None

(* --- Parte 2: Record --- *)
type person_record = {
  name : string;
  age : int;
  email : string option;
}

let make_person_record name age email =
  if age < 0 || age > 150 then failwith "Invalid age"
  else { name; age; email } (* Field punning: name = name è equivalente a name *)

let get_email_record p = p.email

let can_send_adult_email_record p =
  p.age >= 18 && p.email <> None

(* Assert Tests *)
let () =
  (* Test Tuple *)
  let gino = make_person_tuple "gino" 21 (Some "gino@gmail.com") in
  let pino = make_person_tuple "pino" 23 None in
  assert (get_email_tuple gino = Some "gino@gmail.com");
  assert (get_email_tuple pino = None);
  assert (can_send_adult_email_tuple gino);
  assert (not (can_send_adult_email_tuple pino));

  (* Test Record *)
  let gino_r = make_person_record "gino" 21 (Some "gino@gmail.com") in
  let pino_r = make_person_record "pino" 23 None in
  assert (get_email_record gino_r = Some "gino@gmail.com");
  assert (get_email_record pino_r = None);
  assert (can_send_adult_email_record gino_r);
  assert (not (can_send_adult_email_record pino_r));
  
  (* Test Errori *)
  assert (try let _ = make_person_tuple "Old" 200 None in false with Failure _ -> true);
  assert (try let _ = make_person_record "Old" 200 None in false with Failure _ -> true)