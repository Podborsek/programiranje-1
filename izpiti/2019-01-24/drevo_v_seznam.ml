(*Repno rekurzivna funkcija iz drevesa v urejen seznam*)
type 'a tree = Empty | Node of 'a tree * 'a * 'a tree

(* mode:
1 = desno dokler mores
2 = korak levo potem mode 1
 *)


let f (drevo : 'a tree) =
    let rec pom levi drevo mode acc =
        if mode = 1 then
            match drevo with
            | Node(Empty, x, Empty) ->
                match levi with
                | [] -> x :: acc
                | l :: levi' -> pom levi' l 2 (x :: acc)
            | Node(l, x, Empty) -> pom levi l 1 (x :: acc)
            | Node(l,x,d) -> pom ( (Node(l,x,Empty)) :: levi) d 1 acc
            | Empty -> []
        else
            match drevo with
            | Node(Empty,x,_) ->
                match levi with
                | [] -> x :: acc
                | l :: levi' -> pom levi' l 2 (x :: acc)
            | Node(l,x,_) -> pom levi l 1 (x :: acc)
            | Empty -> []
    in pom [] drevo 1 []


let test_tree = Node((Node(leaf 0, 2, Empty)),5,Node(leaf 6, 7, leaf 11))

