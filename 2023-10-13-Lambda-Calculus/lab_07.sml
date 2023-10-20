(* lab 7 | Yash Mittal | 112101054 *)


(* Q1
Define an ML datatype expr that capture lambda calculus
expressions. Use the Atom module to represent variables.
 *)

datatype expr = VAR of Atom.atom
|   APPLY of expr*expr
|   LAMBDA of Atom.atom*expr



(* Q2
Define a function pretty : expr -> string that pretty prints the
lambda calculus expressions.
*)

fun pretty (VAR x)        = Atom.toString x
      | pretty (APPLY (e1,e2))  = String.concat[pretty e1,pretty e2]
      | pretty (LAMBDA (x,e)) = String.concat[Atom.toString x,pretty e]




(* Q3
Write functions free : expr -> atom set and bound : expr -> atom set that computes free and bound variables in a given lambda
calculus expression respectively. You can use AtomSet structure
given by the signature ORD_SET
 *)

(* free : expr -> AtomSet  *)
fun free ( VAR x )             = AtomSet.singleton x
    |   free ( APPLY (e1,e2) ) = AtomSet.union( free e1, free e2 )
    |   free ( LAMBDA (x,e) )  = AtomSet.subtract (free e , x );


(* bound : expr -> AtomSet *)
fun bound ( LAMBDA (x,e) )   = AtomSet.union( AtomSet.singleton x, bound e )
    |   bound (APPLY(e1,e2)) = AtomSet.union( bound e1, bound e2 )
    |   bound ( VAR x )      = AtomSet.empty;



(* Q4
Write a function subst : expr -> atom * expr -> expr, where
subst e₁ (x, e₂) substitutes in e₁ all free occurance of x by
e₂.
 *)

(* subst : expr -> atom -> expr -> expr *)
fun subst (VAR y) x e2               = if Atom.same(y,x) then e2 else (VAR y)
    | subst ( APPLY(e1,e11) ) x e2   = APPLY( subst e1 x e2, subst e11 x e2 )
    | subst ( LAMBDA( y, e1 ) ) x e2 = if Atom.same(y,x) then LAMBDA(y, e1) else LAMBDA(y, subst e1 x e2 );




(* Q5
Write a function fresh : atom set -> atom which computes a fresh
variable name given a set of variables.
 *)


(*  diagonalize : string -> string -> string *)
fun diagonalize x y = if (String.isPrefix x y) then (y ^ "z") else (x ^ "z");


(* diag : string -> atom -> string *)
fun diag a x = let val s =  (Atom.toString x)
            in
                diagonalize s a
            end


(* fresh : AtomSet -> atom *)
fun fresh atomset = let fun sumf (x, a) = diag a x
                in
                        Atom.atom( AtomSet.foldl sumf "" atomset )
                end




