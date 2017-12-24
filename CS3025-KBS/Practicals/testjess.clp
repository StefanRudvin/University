; ===============================================
; testjess.clp
; ===============================================

; TEST 1
; clear Jess
(clear)

; do the assert
(bind ?myfact (assert (this is a test fact)))

; show the content of ?myfact to the user
(printout t crlf "The variable ?myfact points to fact " ?myfact crlf crlf)

; show the content of the working memory
(facts)

; do the retract, ?myfact points to the correct fact to be removed
(retract ?myfact)

; show the content of the working memory
(facts)
