(*
Yash MIttal || 112101054 
*)


(* 
Question 1
In the tutorial, we have given two functions curry and uncurry that converts between these two froms for bi-variate functions. Write the tri-variate (i.e. 3 variable) versions of curry and uncurry functions. First step is to write down the type (in the comments).
*)

(* fn : ('a * 'b * 'c -> 'd) -> 'a -> 'b -> 'c -> 'd *)
fun curry   f  a   b   c  = f (a , b, c);

(* fn : ('a -> 'b -> 'c -> 'd) -> 'a * 'b * 'c -> 'd *)
fun uncurry f (a , b , c) = f  a   b  c ;


(* 
Question 2.
Write the functions fst : 'a * 'b -> 'a and snd : 'a * 'b -> 'b that project a tuple into its components.
*)

(* fn : 'a * 'b -> 'a *)
fun fst (a , _) = a;

(* fn : 'a * 'b -> 'b *)
fun snd (_ , b) = b;


(* 
Question 3.
Write the length function for lists length : 'a list -> int .
*)

(* length : 'a list -> int *)
fun length []      = 0
|   length (_::xs) = 1 + length xs;


(* 
Question 4. 
Write the reverse : 'a list -> 'a list function. Be careful to not make it O(n^2) 
*)

(* induct : 'a list -> 'a list -> 'a list *)
fun recur []      a = a
|   recur (x::xs) a = recur xs (x::a);

(* reverse : 'a list -> 'a list *)
fun reverse a = recur a [];


(*
Question 5. 
Write a function to compute the nth element in the Fibonacci sequence fib : int -> int. Be careful for the obvious version is exponential.
*)


(* fibo : int -> int -> int -> int *)
fun fibo 1  1  0    = 1
|   fibo 0  a  b    = a
|   fibo i  a  b    = fibo (i-1) (a + b) a;


(* fib : int -> int *)
fun fib 0 = 0
|   fib n = fibo (n-1) 1 0;

