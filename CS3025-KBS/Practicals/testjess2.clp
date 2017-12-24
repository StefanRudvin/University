; ===============================================
; testjess.clp
; ===============================================

; TEST 2
(clear)

; retrieve the ID of a fact by matching it with a pattern on the
; LHS of a rule

(defrule retrieve-fact
    ?myfact <- (this is a test fact)
    =>
    (printout t crlf "The variable ?myfact points to fact " ?myfact crlf crlf)
    (facts)
    (retract ?myfact)
)

; assert the fact
(assert (this is a test fact))

; show the working memory and agenda
(facts)
(agenda)

; start the inference engine
(run)

; show working memory and agenda
(facts)
(agenda)
