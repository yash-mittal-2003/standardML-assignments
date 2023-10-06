(* 112101054 | Yash MIttal

References in Standard ML..

Deadline : 6th October 2023.

In this assignment, we use the `ref` construct of Standard ML to
create a counter. SML provides first class references to create a
mutable cell. The syntax of it is as follows

```
val x = ref 0   (* create a reference cell with initial value 0 *)
val _ = x := 42 (* store 42 inside the reference cell in the variable x *)
val vx = !x     (* get the value out of the reference cell *)

```

Also we have the `;` operator with the following syntax `e1 ; e2`
reduces `e1` first and then reduces `e2`. The value of `e1; e2` is the
value of `e2`.
*)

(*
1. Define a Counter structure that has an internal ref cell and
   exposes the three functions, `incr : unit -> unit`, `decrement :
   unit -> unit`, `get : unit -> int`. The outside world should not
   have any other access to the counter.  Hint: You will have to
   define a signature say COUNTER and restrict he signature of your
   Counter structure appropriately.
*)
signature COUNTER =
sig
   val incr : unit -> unit
   val decrement : unit -> unit
   val get  : unit -> int
end

structure Counter :> COUNTER =
struct
   val num = ref 0
   fun incr () = (num := !num + 1)
   fun decrement () = (num := !num - 1)
   fun get  () = !num
end



(*
2. What if your program requires two or more counter ? Instead of a
   plain `Counter` structure define a `MkCounter` functor which
   creates a structure of the previous kind. This way you can have
   multiple counters.

```
	   structure A = MkCounter ()
	   structure B = MkCounter ()

	   A.incr ()
	   B.decr ()
	   ...
```
*)
functor MkCounter () :> COUNTER =
struct
   val num = ref 0
   fun incr () = (num := !num + 1)
   fun decrement () = (num := !num - 1)
   fun get  () = !num
end


