

let map2_opt f xs ys = 
    if (List.length xs) != (List.length ys) then None
    else let rec pom xs ys acc =
        match xs with
        | [] -> Some(List.rev acc)
        | x :: xs' -> pom xs' (List.tl ys) ((f x (List.hd ys)) :: acc )
    in pom xs ys []




(*  2.  *)

type filter_tree = Node of filter_tree * int * filter_tree | Sez of int list

let primer = Node(Node(Sez([1]),5,Sez([])),10,Node(Sez([]),15,Sez([19;20])))

let rec vstavi n drevo = 
    match drevo with
    | Node(l,f,d) -> if n <= f then Node(vstavi n l, f, d) else Node(l,f, vstavi n d)
    | Sez(xs) -> Sez(n :: xs)

let rec vstavi_seznam xs drevo = 
    match xs with
    | [] -> drevo
    | x :: xs' -> vstavi_seznam xs' (vstavi x drevo)

let rec drevo_to_list drevo = 
    match drevo with
    | Sez(xs) -> xs
    | Node(l,_,d) -> (drevo_to_list l) @ (drevo_to_list d)



(*  3.  *)

module type Linearna = sig
    type t

    type vektor = int * int
    type matrika = int * int * int * int

    val id : t
    val uporabi : t -> vektor -> vektor
    val iz_matrike : matrika -> t
    val iz_funkcije : (vektor -> vektor) -> t
    val kompozitum : t -> t -> t 
end