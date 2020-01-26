(* 1.*)
type izraz = Stevilo of int | Plus of izraz * izraz | Krat of izraz * izraz

let primer = Krat(Plus(Stevilo 1, Stevilo 2), Plus(Stevilo 3, Stevilo 4))

let rec izracunaj = function
    | Stevilo x -> x
    | Plus(x,y) -> (izracunaj x) + (izracunaj y)
    | Krat(x,y) -> (izracunaj x) * (izracunaj y)

let zmnozi x y = izracunaj (Krat(x,y))



(* 3.*)

let orbite f x =
    let rec pom x acc = 
        let a = f x in
        if List.mem a acc || 100 < List.length acc then List.rev acc
        else pom a (a :: acc)
    in pom x []