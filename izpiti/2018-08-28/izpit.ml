
let razlika_kvadratov a b = (a+b) * (a+b) - (a*a + b*b)

let uporabi_na_paru f (a1,a2) = (f a1, f a2)

let rec ponovi_sez n xs =
    if n <= 0 then [] else xs @ ponovi_sez (n-1) xs

let razdeli sez =
    let rec pom xs (ls,ds) =
        match xs with
        | [] -> (ls,ds)
        | x :: xs' -> if x < 0 then pom xs' (x :: ls, ds) else pom xs' (ls, x :: ds)
    in pom sez ([],[])




type 'a drevo = Empty | Node of 'a drevo * 'a * 'a drevo


type 'a veriga = 
| Filter of ('a -> bool) * 'a list * 'a veriga
| Ostalo of 'a list

let test = Filter((fun x -> x < 0), [], 
                Filter((fun x -> x < 10),[],
                    Ostalo []))

let rec vstavi x ver = 
    match ver with
    | Filter(f,xs,ver') -> if f x then Filter(f, x :: xs, ver') else Filter(f,xs, vstavi x ver')
    | Ostalo(xs) -> Ostalo(x::xs)

let rec poisci x ver = 
    match ver with
    | Ostalo(xs) -> List.mem x xs
    | Filter(f,xs,ver') -> if f x then List.mem x xs else poisci x ver'

let rec izprazni_filtre ver =
    match ver with
    | Ostalo(xs) -> (Ostalo([]), xs)
    | Filter(f,xs,ver') -> let (ver'', sez) = izprazni_filtre ver' in (Filter(f,[],ver''), xs @ sez)

let dodaj_filter f ver = 
    let (ver', sez) = izprazni_filtre ver in
    let fltr = Filter(f,[],ver') in
    List.fold_left (fun x y -> vstavi y x) fltr sez 