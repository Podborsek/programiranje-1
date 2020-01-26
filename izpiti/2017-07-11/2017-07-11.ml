(*1.*)
type rezultati = Neudelezen | Rezultat of int * int * int * int

type student = {ime : string; priimek : string; vpisna_stevikla : int; rezultati : rezultati}


let a = {ime="Ana"; priimek="Bertoncelj"; vpisna_stevikla=1; rezultati=Rezultat(10,20,15,2)}
let b = {ime="Bine"; priimek="Cencelj"; vpisna_stevikla=2; rezultati=Rezultat(5,13,20,17)}
let c = {ime="Cilka"; priimek="Drnovsek"; vpisna_stevikla=3; rezultati=Neudelezen}

let l = [a;b;c]

let vsota_tock x =
    match x.rezultati with
    | Neudelezen -> None
    | Rezultat(a,b,c,d) -> Some(a+b+c+d)

let opt_v_int = function
    | None -> 0
    | Some x -> x


let najboljsi l =
    let rec pom ss acc =
        match ss with
        | [] -> acc
        | s :: ss' -> let x = opt_v_int(vsota_tock s) in let a = opt_v_int(vsota_tock acc) in        if a < x then pom ss' s else pom ss' acc
    in pom (List.tl l) (List.hd l)  




(* 2. *)

type vozlisca = Vozlisca of int list
type par = Par of int * int
type povezave = Povezave of par list
type graf = Graf of vozlisca * povezave

let v = Vozlisca([(1;2;3;4;5)])
let p = Povezave([Par(1,2); Par(1,3), Par(2,4), Par(3,5), Par(4,5)])
let g = Graf(v,p)