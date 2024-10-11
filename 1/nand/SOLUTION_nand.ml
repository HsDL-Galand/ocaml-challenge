(*
# Logical Nand

Write a function of type:
```ocaml
nand : bool -> bool -> bool
```
that implements the logical connective [nand](https://en.wikipedia.org/wiki/Sheffer_stroke) ("not both").

Try with different implementation styles, using:
- the built-in logical connectives `not`, `&&`, `||`;
- conditional expressions;
- pattern matching.
*)

let nand1 a b = not(a && b)

let nand1_1 (a : bool) (b : bool) : bool = not(a && b)

let nand2 a b = if(a && b) then false else true

let nand2_2 a b = if a then if b then false else true else true
let nand2_3 (a : bool) (b : bool) : bool =
  if a
    then if b
      then false
      else true
    else true

let nand3 a b = match(a,b) with
  | (false,false) -> true
  | (false,true) -> true
  | (true,false) -> true
  | (true,true) -> false

let nand3_2 (a : bool) (b : bool) : bool = match(a,b) with
  | (true,true) -> false
  | _ -> true