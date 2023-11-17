(* Q1 *)

datatype Expr = Const of real
|   var of Atom.atom
|   plus of Expr*Expr
|   mul of Expr*Expr


datatype Stmt = Assignment of Atom.atom*Expr
| Print of Expr


type Program = Stmt list








(* Q2 *)

(* val eval      : Env -> Expr -> real option *)
fun eval _ (Const x)          = SOME x
    |   eval e (var x)        = AtomMap.find( e , x )
    |   eval e ( plus (x,y) ) = let val result = case (eval e x) of
                                NONE => NONE 
                                | (SOME xresult ) => case (eval e y) of
                                                    NONE => NONE
                                                | (SOME yresult) => SOME (xresult + yresult)
                                in
                                    result
                                end
    |   eval e ( mul (x ,y) ) = let val result = case ( eval e x ) of
                                NONE => NONE
                                | ( SOME xresult ) => case ( eval e y ) of
                                                    NONE => NONE
                                                    | ( SOME yresult ) => SOME (xresult*yresult)
                                in
                                    result
                                end




(* val execute   : Env -> Stmt -> Env *)
fun execute e (Assignment ( x , y) ) = let val result = case ( eval e y ) of
                                                        NONE => e
                                                    | SOME(yresult)  => AtomMap.insert ( e, x, yresult )
                                        in
                                            result
                                        end

    | execute  e ( Print x ) = let val result = case ( eval e x ) of
                                                        NONE => e
                                                    |   SOME ( xresult ) => ((print ( Real.toString xresult ^ "\n" )); e)
                                        in
                                            result
                                        end



type Env = real AtomMap.map

fun foo (a,b) = execute b a


(* val interpret : Program -> unit *)
fun interpret slist = let val res = foldl foo AtomMap.empty slist
                    in
                        ()
                    end



(* 
val env : Env = AtomMap.empty

val x = plus( Const 5.0 , mul ( Const 8.0, Const 12.0 )  );

val env = execute env (Print x); 
*)
