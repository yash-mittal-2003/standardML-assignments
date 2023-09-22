(* Yash Mittal || 112101054*)

(*
Q1.
Define the functions foldr and foldl using the pattern matching
for list.
*)

(* foldr : ('a * 'b -> 'b) -> 'b  -> 'a list -> 'b *)

 fun foldr F y [] = y
 |   foldr F y (x::xs) = F(x, foldr F y xs) ;

(* foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b *)
 fun foldl F y [] = y
 |   foldl F y (x::xs) = foldl F (F(x,y)) xs ;

(*
Q2.
Without using pattern matching, define the function sum : int list -> int that computes the sum of a list of integers.
*)

(* sum: int-> int-> int  *)
fun sum (a,b) = a+b;


(* sum_itr: int list-> int *)
fun sum_itr a = foldr sum 0 a;


(*
Q3.
Instead of using explicit recursion, define the following library
function in terms of either foldr or foldl which ever is
convenient. For the documentation of these library function, read the
documentation of the List
structure
*)

(*
partition : ('a -> bool) -> 'a list -> 'a list * 'a list
*)
fun partition check a = let fun helper ( x , (u,v) ) = if check x then ( x::u , v )
                                                        else ( u, x::v )
                            in
                                foldr helper ([],[]) a
                            end;
 
(*
 fun sample_check a = if (a>=5) then true
                else false

function to act as a sample check for partition, try giving a list [1,2,6] it
should return ([6],[1,2]) 
*)


(*
map : ('a -> 'b) -> 'a list -> 'b list.
*)


fun map apply a = let fun helper2 ( x , b ) = apply x::b
                      in
                         foldr helper2 [] a
                      end;
                      

                        


(*
addend 'a * 'a list -> 'a list
*)
fun addend (a,b) = a::b

(*
reverse: 'a list -> 'a list
*)
fun reverse a = foldl addend [] a

(*
nth : 'a list * int -> 'a option
*)

datatype 'a Find = LookingFor of int
| Found      of 'a
(*
nthAux : 'a list * int -> 'a FInd
*)

fun nthAux ( alist , index ) = let fun isFound ( a , LookingFor(n) ) = if n = 0  then Found(a)
                                                          else LookingFor(n-1)
                                |  isFound (a, Found(n)) = Found(n)
                       in
                         foldl isFound(LookingFor(index)) alist
                       end;

(* dataype 'a option = Node | valueIs of 'a *)
datatype 'a option = None | ValueIs of 'a;

(* 'a list * int -> 'a option *)
fun nth ( alist, index ) = case nthAux( alist, index ) of
                            LookingFor(x) => None
                            | Found(x)    => ValueIs(x);






