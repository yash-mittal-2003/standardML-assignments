(* Yash Mittal  | 112101054  | lab_08 *)


(*
Q1 
Define abstract syntax for λ-let and λ-letrec as a SML datatype.
*)

datatype expr = VAR of Atom.atom
|   APPLY of expr*expr
|   LAMBDA of Atom.atom*expr


datatype lambdalet = VAR_LET of Atom.atom
|   APPLY_LET of lambdalet*lambdalet
|   LAMBDA_LET of Atom.atom*lambdalet
|   LET of Atom.atom*lambdalet*lambdalet


datatype lambdareclet = VAR_LET of Atom.atom
|   APPLY_LET of lambdareclet*lambdareclet
|   LAMBDA_LET of Atom.atom*lambdareclet
|   LET of Atom.atom*lambdareclet*lambdareclet



(*
Q2
Write the conversion λ-let to λ-calculus.
*)

(* lletTolcalculas : lambdalet -> expr *)
fun lletTolcalculas (VAR_LET x)            = VAR x
    | lletTolcalculas (APPLY_LET (a, b)) = APPLY (lletTolcalculas a, lletTolcalculas b)
    | lletTolcalculas (LAMBDA_LET (x, c))  = LAMBDA (x, lletTolcalculas c)
    | lletTolcalculas (LET (x, a, b))    = APPLY (LAMBDA (x, lletTolcalculas b), lletTolcalculas a)
