let rec naloga1a fs x =
    match fs with
    | [] -> x
    | f :: fs' -> naloga1a fs' (f x)

let rec naloga1b fs x =
    match fs with
    | [] -> x
    | f :: fs' -> if x < (f x) then naloga1b fs' (f x) else naloga1b fs' x


let podzaporedja xs = 
(* 2. *)