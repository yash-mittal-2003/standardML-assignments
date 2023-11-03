(* Yash Mittal | 112101054 *)

(*
Q1
Capture the De Bruijn representation of lambda calculus as a SML
data type.
*)

datatype bruijn_expr = VAR_D of int
|   APPLY_D of bruijn_expr*bruijn_expr
|   LAMBDA_D of bruijn_expr

datatype expr = VAR of Atom.atom
|   APPLY of expr*expr
|   LAMBDA of Atom.atom*expr




(*
Q2
Write a program to convert from De Bruijn index to the first order
representation of lambda calculus expression.
*)

(*  diagonalize : string -> string -> string *)

fun diagonalize a b = if (String.isPrefix a b) then (b ^ "z") else (a ^ "z");


(* diaA : string -> atom -> string *)

fun diaA a x = let val v =  (Atom.toString x)
            in
                diagonalize v a
            end

(* fresh : AtomSet -> atom *)

fun fresh atomset = let fun sumf (x, a) = diaA a x
                in
                    Atom.atom( AtomSet.foldl sumf "" atomset )
                end

(* bruijn_expr_to_lambda_helper : string list -> AtomSet -> bruijn_expr -> expr *)
fun  bruijn_expr_to_lambda_helper list set (VAR_D index)               = let val nth = List.nth (list, index - 1)
                                                                    in
                                                                        VAR (Atom.atom nth)
                                                                    end


    | bruijn_expr_to_lambda_helper list set (APPLY_D (exp1, exp2))     = APPLY (bruijn_expr_to_lambda_helper list set exp1, bruijn_expr_to_lambda_helper list set exp2)


    | bruijn_expr_to_lambda_helper list set (LAMBDA_D exp)             =  let val nList = Atom.toString(fresh set) :: list
                                                                              val nSet  = AtomSet.add(set, fresh set)
                                                                    in
                                                                        LAMBDA (fresh set, bruijn_expr_to_lambda_helper nList nSet exp)
                                                                    end

(* bruijn_expr_to_lambda = bruijn_expr -> expr *)
fun bruijn_expr_to_lambda bruijn_expr = bruijn_expr_to_lambda_helper [] AtomSet.empty bruijn_expr;






