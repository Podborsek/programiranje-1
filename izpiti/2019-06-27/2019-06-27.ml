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

let rec globina_oddajanja v =
    match v with
    | Obdelovan(y) -> 0
    | Prost -> 0
    | Oddan(y,(v',vs)) -> 1

let rec vsi_najemniki v =
    let rec pom v acc =
        match v with
        | Prost -> acc