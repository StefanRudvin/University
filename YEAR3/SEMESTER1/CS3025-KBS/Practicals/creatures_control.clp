; =========================================================
; creatures_control.clp
; =========================================================

; clear Jess

(clear)

; load the rule base

(batch "creatures.clp")

; Initialise the working memory with observations

(deffacts observations
(creature body-covering is hair)
(creature eats grass)
(creature colour is black and white)
)

; Reset Jess to load the observations into working memory

(reset)

; show the content of working memory (facts list) and agenda

(facts)
(agenda)

; run the expert system

(run)

; check the working memory for the answer

(facts)
