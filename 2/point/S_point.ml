(*
Point
Define a type `point` representing a point in the plane with two coordinates `x` and `y`, both of type `float`.

Write a function:
translate : point -> float -> float -> point

that returns the point obtained by adding the given offsets to the coordinates.

Write a function:
distance_from_origin : point -> float

that returns the distance of a point from the origin. You may need to use some functions from the [Float](https://ocaml.org/manual/4.08/libref/Float.html) library.

Then, define two types: 
- a tagged union type `color` with constructors `Red`, `Green`, and `Blue`;
- a product type `colored_point` combining a point and a color.

Write a function:
same_color : colored_point -> colored_point -> bool

that returns true if the two points have the same color.

Write a function:
recolor : colored_point -> color -> colored_point

that returns a new colored point with the same coordinates but a new color.

Write unit tests for your functions, using the `assert` statement.

*)

type pointX = {x : float ; y : float}
let punto1 = {x = 1.2; y = 2.4}			(* Test *)
let (punto2 : pointX) = {x = 1.2; y = 2.4}	(* Test *)
let translate punto a b = {x = (a +. punto.x) ; y = (b +. punto.y)}
let distance_from_origin punto = sqrt ((Float.pow (punto.x) (2.)) +. (Float.pow (punto.y) (2.))) (* distanza = sqrt(x² + y²) *)

type colorX = Red | Green | Blue
type colored_point = {punto : pointX ; colore : colorX}

let same_color cp1 cp2 = cp1.colore = cp2.colore

let recolor colored_point new_color = {colored_point with colore = new_color}
let recolor_old cp c = {punto = cp.punto  ; colore = c}

(* ASSERT TEST *)
let p1 = { x = 3.0; y = 4.0 };;
let p2 = translate p1 1.0 (-2.0);; (* p2 dovrebbe essere { x = 4.0; y = 2.0 } *)
assert (p2.x = 4.0);;
assert (p2.y = 2.0);;
assert (distance_from_origin p1 = 5.0);;
assert (distance_from_origin { x = 0.0; y = 0.0 } = 0.0);;
let cp1X = { punto = p1; colore = Red };;
let cp2X = { punto = p2; colore = Red };;
let cp3X = { punto = { x = 1.0; y = 1.0 }; colore = Blue };;
assert (same_color cp1X cp2X = true);;
assert (same_color cp1X cp3X = false);;
let cp4X = recolor cp1X Green;;
assert (same_color cp1X cp4X = false);;
assert (cp4X.colore = Green);;
assert (cp4X.punto.x = cp1X.punto.x);; (* Le coordinate non devono cambiare *)



(***************************** \/ GEMINI \/ *****************************)



(* Definiamo il tipo `point` come un record con due campi float, `x` e `y`.
   I record sono utili per raggruppare dati con un nome. *)
type point = { x : float; y : float }

(* `translate` prende un punto e due offset (dx, dy) e restituisce un nuovo punto
   con le coordinate traslate. Usiamo `p.x` per accedere al campo `x` del record `p`.
   L'operatore per la somma tra float è `+.` *)
let translate (p : point) (dx : float) (dy : float) : point =
  { x = p.x +. dx; y = p.y +. dy }

(* `distance_from_origin` calcola la distanza Euclidea dall'origine (0,0).
   La formula è sqrt(x^2 + y^2). Usiamo le funzioni dal modulo `Float`. *)
let distance_from_origin (p : point) : float =
  Float.sqrt (p.x *. p.x +. p.y *. p.y)

(* Definiamo un tipo `color` come una "tagged union" (o tipo somma).
   Può assumere uno dei tre valori specificati. *)
type color = Red | Green | Blue

(* Definiamo `colored_point` come un "product type", in questo caso un record
   che combina un `point` e un `color`. *)
type colored_point = { point : point; color : color }

(* `same_color` confronta due punti colorati.
   L'uguaglianza strutturale di OCaml (`=`) funziona direttamente sui tipi variant
   come `color`, quindi possiamo confrontare direttamente i campi `color`. *)
let same_color (cp1 : colored_point) (cp2 : colored_point) : bool =
  cp1.color = cp2.color

(* `recolor` crea un nuovo punto colorato partendo da uno esistente,
   ma sostituendo il colore. Usiamo la sintassi di copia dei record `{ cp with ... }`
   che è comoda per creare una nuova versione di un record modificando solo alcuni campi. *)
let recolor (cp : colored_point) (new_c : color) : colored_point =
  { cp with color = new_c }


(* === TEST UNITARI === *)
;;

(* Test per `point`, `translate` e `distance_from_origin` *)
let p1 = { x = 3.0; y = 4.0 };;
let p2 = translate p1 1.0 (-2.0);; (* p2 dovrebbe essere { x = 4.0; y = 2.0 } *)

assert (p2.x = 4.0);;
assert (p2.y = 2.0);;
assert (distance_from_origin p1 = 5.0);;
assert (distance_from_origin { x = 0.0; y = 0.0 } = 0.0);;

(* Test per `color` e `colored_point` *)
let cp1 = { point = p1; color = Red };;
let cp2 = { point = p2; color = Red };;
let cp3 = { point = { x = 1.0; y = 1.0 }; color = Blue };;

assert (same_color cp1 cp2 = true);;
assert (same_color cp1 cp3 = false);;

let cp4 = recolor cp1 Green;;
assert (same_color cp1 cp4 = false);;
assert (cp4.color = Green);;
assert (cp4.point.x = cp1.point.x);; (* Le coordinate non devono cambiare *)