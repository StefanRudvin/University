; ============================================================================
; creatures.clp
; ============================================================================

; Define the rules of your expert system

(defrule mammal-1
  (creature body-covering is hair)
  =>
  (assert (creature is a mammal)) )

(defrule mammal-2
  (creature feeds young on milk)
  =>
  (assert (creature is a mammal)) )

(defrule bird-1
  (creature body covering is feathers)
  =>
  (assert (creature is a bird)) )

(defrule bird-2
  (creature flies)
  (creature lays eggs)
  =>
  (assert (creature is a bird)) )

(defrule feeding-type-1
  (creature is a mammal)
  (creature eats meat)
  =>
  (assert (creature is a carnivore)) )

(defrule feeding-type-2
  (creature has pointed teeth)
  (creature has claws)
  (creature has eyes pointing forward)
  (creature is a mammal)
    =>
  (assert (creature is a carnivore)) )

(defrule feeding-type-3
  (creature is a mammal)
  (creature eats grass)
    =>
  (assert (creature is an ungulate)) )

(defrule feeding-type-4
  (creature is a mammal)
  (creature has hoofs)
  =>
  (assert (creature is an ungulate)) )

(defrule species-1
  (creature is a carnivore)
  (creature colour is tawny)
  (creature marking is dark spots)
  =>
  (assert (species is cheetah)) )

(defrule species-2
  (creature is a carnivore)
  (creature colour is tawny)
  (creature marking is black stripes)
  =>
  (assert (species is tiger)) )

(defrule species-3
  (creature is an ungulate)
  (creature colour is tawny)
  (creature marking is dark spots)
  (creature has long legs and neck)
  =>
  (assert (species is giraffe)) )

(defrule species-4
  (creature is an ungulate)
  (creature colour is black and white)
  =>
  (assert (species is zebra))
  (printout t “Answer: Zebra!” crlf)
)

(defrule species-5
  (creature is a bird)
  (creature walks)
  (creature colour is black and white)
  (creature has long legs and neck)
  =>
  (assert (species is ostrich))
  (printout t “Answer: Ostrich!” crlf)
)

(defrule species-6
  (creature is a bird)
  (creature swims)
  (creature colour is black and white)
  =>
  (assert (species is penguin)) )

(defrule species-7
  (creature is a bird)
  (creature flies)
  =>
  (assert (species is albatross)) )
