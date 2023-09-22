(* Yash Mittal | 112101054 | LAB - 3 *)



(*
 Q1.
 Define the data type 'a tree that captures a binary tree.
 *)

(* datatype 'a tree : nulltree | node of 'a tree * 'a * 'a tree *)
datatype 'a tree  = nulltree
| node of  'a * 'a tree * 'a tree

(*
Q2
Write a function mapT analogues to map for list ?  First write its type and then complete its definition.
*)

(* treemap : ( 'a -> 'b ) -> 'a tree -> 'b tree *)
fun treemap f nulltree                         = nulltree
    |   treemap f (node( root, left , right )) = node( f root ,treemap f left , treemap f right )
    
(*
Q3
Define the in-order, pre-order and post-order traversal of the binary tree returning the list of nodes in the given order. First write down the type of the function(s) and then go about defining
them.
*)

(* inorder : 'a tree -> 'a list *)
fun inorder nulltree = []
    |   inorder (node(root,left,right)) = (inorder left) @ [root] @ (inorder right)


(* preorder : 'a tree -> 'a list *)
fun preorder nulltree = []
    |   preorder (node(root,left,right)) = [root] @ (preorder left) @ (preorder right)


(* postorder : 'a tree -> 'a list *)
fun postorder nulltree = []
    |   postorder (node(root,left,right)) = (postorder left) @ (postorder right) @ [root]
    
    
(*
Q4
Define a tree fold function analogous to the foldr and foldl functions.
*)


(* fn : ('a * 'b -> 'b) -> 'b -> 'a tree -> 'b *)

(* fun foldTree f b nulltree = b
| foldTree f b (node(root,left,right)) = f ((foldTree f (foldTree f b left) right),root)  -- can you please provide comments on why this does not work
*)

fun foldTree f s nulltree                 = s
|       foldTree f s (node(root,left,right)) = f root (foldTree f s left) (foldTree f s right) 


(*
Q5
Express the above traversals in terms of tree fold.
*)

(* inorder : 'a tree -> 'a list *)
fun inFold T = let fun f n l r = l @ [n] @ r
                           in foldTree f [] T
                           end

(*
        preFold : 'a tree -> 'a list
*)

fun preFold T = let fun f n l r = [n] @ l @ r
                            in foldTree f [] T
                            end
                            
(*
        postFold : 'a tree -> 'a list
*)

fun postFold T = let fun f n l r =  l @ r @ [n]
                             in foldTree f [] T
                             end
(*
Q6
Define the rotate clockwise function for binary trees. Pictorially this rotation function is defined as the following.
            a                   b
           / \                 / \
          /   \               /   \
         b    🌲₃  ======>   🌲₁  a
        / \                       / \
       /   \                     /   \
      🌲₁ 🌲₂                  🌲₂ 🌲₃
If the left subtree of the root is null then rotation is identity operation.
*)

(* clkrot : 'a tree -> 'a tree *)

fun clkrot (node( a, node( b, lt , rt ), n ))     = node(  b ,lt , node ( a ,rt , n) )
    |   clkrot c                                     = c

