type complex = {re : float; im : float}

let complex_add a b = {re = a.re +. b.re; im = a.im +. b.im}

let complex_conjugate z = {re = z.re ; im = -. z.im}

let list_apply_either pred f g xs =
    let rec pom pred f g xs acc =
        match xs with
        | x :: xs' -> if pred x then pom pred f g xs' ((f x) :: acc) else pom pred f g xs' ((g x) :: acc)
        | [] -> List.rev acc
    in pom pred f g xs []


(*Prepisno lepo potenciranje *)
let rec dekomp n xs =
    if n = 1 then xs else
    if n mod 2 = 0 then dekomp (n / 2) (2::xs)
    else dekomp (n-1) (1::xs)

let eksponent x p =
    if p = 0 then 1 else
        let ps = dekomp p [] in
        let rec pom org cur ps =
            match ps with
            | [] -> cur
            | p :: ps' -> if p = 2 then pom org (cur * cur) ps' else pom org (org * cur) ps'
        in pom x x ps

(*Konec prepisa *)

let eval_poly pol x =
    let rec pom x ps cur n =
        match ps with
        | [] -> cur
        | p :: ps' -> let nova = eksponent x n in pom x ps' (cur + (p * nova) ) (n+1)
    in pom x pol 0 0

let test_pol = [3; -2; 0; 1]


(*2*)


type najemnik = string
type vrt =  | Obdelovan of najemnik
            | Oddan of najemnik * (vrt * vrt list)
            | Prost

let vrt_primer = Oddan("Kovalevskaya",(Prost,[Obdelovan("Galois"); Obdelovan("Lagrange")]))
let vrt_primer2 = Oddan("Kovalevskaya",(Obdelovan("Kovalevskaya"),[Obdelovan("Galois"); Obdelovan("Lagrange")]))


let rec obdelovalec_vrta x =
    match x with
    | Obdelovan(y) -> Some(y)
    | Oddan(y,(v,vs)) -> obdelovalec_vrta v
    | Prost -> None

let rec globina_oddajanja = function
    (*Mogoce problem pri tretji varianti ce je vs prazn*)
    | Prost -> 0
    | Obdelovan(_) -> 0
    | Oddan(_,(v,vs)) -> 1 + List.fold_left max (globina_oddajanja v) (List.map globina_oddajanja vs)


let rec v_uporabi = function
    | Prost -> false
    | Obdelovan(_) -> true
    | Oddan(_,(v,vs)) -> List.fold_left (||) (v_uporabi v) (List.map v_uporabi vs)

let rec vsi_najemniki = function
    | Prost -> []
    | Obdelovan(x) -> [x]
    | Oddan(y,(v,vs)) -> y :: (List.fold_left (fun a b -> a @ (vsi_najemniki b)) (vsi_najemniki v) (vs))


let rec vsi_obdelovalci = function
    | Prost -> []
    | Obdelovan(x) -> [x]
    | Oddan(_,(v,vs)) -> (List.fold_left (fun a b -> a @ (vsi_obdelovalci b)) (vsi_obdelovalci v) (vs))