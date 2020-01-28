let podvoji_vsoto a b = 2 * (a + b)

let povsod_vecji (x1,x2,x3) (y1,y2,y3) =
    y1 < x1 && y2 < x2 && y3 < x3

let uporabi_ce_lahko f x =
    match x with
    | None -> None
    | Some x' -> Some (f x')

let pojavi_dvakrat a xs = 
    let rec pom a xs n =
        match xs with
        | x :: xs' -> if a = x then pom a xs' (n+1) else pom a xs' n
        | [] -> n = 2
    in pom a xs 0


let izracunaj_v_tocki a fs = 
    let rec pom a fs bs =
        match fs with
        | f :: fs' -> pom a fs' ((f a) :: bs)
        | [] -> List.rev bs
    in pom a fs []

let rec dekomp n xs =
    if n = 1 then xs else
    if n mod 2 = 0 then dekomp (n / 2) (2::xs)
    else dekomp (n-1) (1::xs)

let eksponent x p =
    let ps = dekomp p [] in
    let rec pom org cur ps =
        match ps with
        | [] -> cur
        | p :: ps' -> if p = 2 then pom org (cur * cur) ps' else pom org (org * cur) ps'
    in pom x x ps

(* 2. *)

type 'a mm_drevo =
    | Prazno
    | Node of ('a mm_drevo) * 'a * int * ('a mm_drevo)


let rec vstavi drevo x = 
    match drevo with
    | Prazno -> Node(Prazno,x,1,Prazno)
    | Node(l,y,i,d) -> if x = y then Node(l,y,i+1,d) else if x < y then Node(vstavi l x, y, i, d) else Node(l, y, i, vstavi d x)

let multimnozica_iz_seznama xs =
    let rec pom drevo xs =
        match xs with
        | x :: xs' -> pom (vstavi drevo x) xs'
        | [] -> drevo
    in pom Prazno xs

let t = multimnozica_iz_seznama [1;1;1;3;4;2;5;56;56;17]

let rec velikost_multimnozice drevo =
    match drevo with
    | Prazno -> 0
    | Node(l,_,x,d) -> x + (velikost_multimnozice l) + (velikost_multimnozice d)

let ponovi n x =
    let rec pom n acc =
        if n < 1 then acc else pom (n-1) (x::acc)
    in pom n []

let rec prilepi n x acc =
    if n < 1 then acc else prilepi (n-1) x (x::acc)

let rec seznam_iz_multimnozice drevo =
    match drevo with
    | Prazno -> []
    | Node (l,x,n,d) -> (seznam_iz_multimnozice l) @ (ponovi n x) @ (seznam_iz_multimnozice d)

(*

let seznam_iz_multimnozice' drevo =
    (*Treba je prit skrajno desno *)
    let rec pom leva drevo_d acc desno =
        if desno then
        match drevo_d with
        | Node(l,x,n,Prazno) -> pom 
        |

        else
        match drevo with
        |

    in pom drevo [] true

*)