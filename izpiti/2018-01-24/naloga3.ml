type vektor = int * int
type matrika = int * int * int * int

module type Linearna = sig
  (* Tip linearnih preslikav *)
  type t
  (* Identiteta *)
  val id : t
  (* Dano preslikavo uporabi na vektorju *)
  val uporabi : t -> vektor -> vektor
  (* Vrne linearno preslikavo, določeno z matriko *)
  val iz_matrike : matrika -> t
  (* Vrne linearno preslikavo, določeno s funkcijo
     (predpostavite lahko, da je funkcija linearna) *)
  val iz_funkcije : (vektor -> vektor) -> t
  (* Vrne kompozitum danih preslikav. *)
  val kompozitum : t -> t -> t
end


module Matrika : Linearna = struct
  type t = matrika

  let id = (1,0,0,1)
  let uporabi (x,y,z,w) (a,b) = (x*a + y*b, z*a + w*b)
  let iz_matrike (x,y,z,w) = (x,y,z,w)
  let iz_funkcije f =
    let (x,z) = f (1,0) in let (y,w) = f (0,1) in (x,y,z,w)
  let kompozitum (x1,y1,z1,w1) (x2,y2,z2,w2) = (x1*x2 +y1*z2, x1*y2 + y1*w2, z1*x2 + w1*z2, z1*y2 + w1*w2)

end

 

module Funkcija : Linearna = struct
  type t = vektor -> vektor

  let id v = v
  let uporabi f v = f v
  let iz_matrike (x,y,z,w) =
    let f (a,b) = (x*a + y*b, z*a + w*b) in f
  let iz_funkcije f = f
  let kompozitum f g = fun x -> f (g x)

end