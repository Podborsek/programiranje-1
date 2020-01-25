(* 1. *)
let uporabi f x = f x
let ibaropu x f = f x

let zacetnih n xs =
    let rec pom n xs acc =
        if n = 0 then Some(List.rev acc)
        else match xs with
            | x :: xs' -> pom (n-1) xs' (x :: acc)
            | [] -> None
    in pom n xs []


(* 2. *)

type 'a neprazen_seznam = Konec of 'a | Sestavljen of 'a * 'a neprazen_seznam

let test = Sestavljen(1,Sestavljen(2,Sestavljen(3,Konec(4))))

let prvi sez =
    match sez with
    | Konec(a) -> a
    | Sestavljen(a,_) -> a

let rec zadnji sez =
    match sez with
    | Konec(a) -> a
    | Sestavljen(a, sez') -> zadnji sez'


let rec dolzina sez = 
    match sez with
    | Konec(_) -> 1
    | Sestavljen(_, sez') -> 1 + dolzina sez'


let pretvori_v_seznam sez =
    let rec pom sez acc =
        match sez with
        | Konec(a) -> List.rev (a :: acc)
        | Sestavljen(a, sez') -> pom sez' (a :: acc)
    in pom sez []

let rec zlozi f y xs =
    match xs with
    | Konec(x) -> f y x
    | Sestavljen(x, xs') -> zlozi f (f y x) xs'