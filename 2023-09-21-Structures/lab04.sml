(* Q1
Write the quick sort algorithm as a functor that takes the ordering
through its input structure 
*)

signature SORT = sig
    type t
    val sort : t list -> t list
end

signature ORD_KEY = 
sig
    type ord_key
  (* abstract type of keys that have a total order *)

    val compare : ord_key * ord_key -> order
  (* comparison function for the ordering on keys *)

end(* ORD_KEY*)


functor Qsort ( O : ORD_KEY ) : SORT = struct

    type t = O.ord_key

    (* helper : O.ord_key -> O.ord_key -> bool *)
    fun helper a b = if O.compare(a,b) = LESS then false else true

    fun sort [] = []
        | sort (x::xs) = let val ( l, r ) = List.partition (helper x) xs
            in
                sort l @ [x] @ sort r
            end
end





(* Q2 *)
structure IntOrd : ORD_KEY = struct
    type ord_key = int
    val compare = Int.compare
end

structure quickSort = Qsort (IntOrd);

quickSort.sort [~1,2,45,61,0,11,~12];
