; ===============================================
; simple.clp
; ===============================================

; clear Jess

(clear)

; Initialise the Working Memory
; we add three simple facts to working memory

(deffacts simple-data
(B)
(C)
(G)
)

; Define the rules of your program
; NOTE: a defrule allows to include a description of the
; rule after the rule name enclosed in " "

(defrule R1 "R1: If A then C"
(A)
=>
(assert (C))
)

(defrule R2 "R2: If B and C then E"
(B)
(C)
=>
(assert (E))
)

(defrule R3 "R3: If C and D then F"
(C)
(D)
=>
(assert (F))
)

(defrule R4 "R4: If E then H"
(E)
=>
(assert (H))
)

(defrule R5 "R5: If F then H"
(F)
=>
(assert (H))
)

(defrule R6 "R6: If G and H then I"
(G)
(H)
=>
(assert (I))
)

(defrule R7 "R7: If H then J"
(H)
=>
(assert (J))
)

; Add control statements to initialize and run your program,
; and to show the content of the facts list and the agenda

; Initialise the working memory with the data specified in
; the deffacts statement

(reset)

; print out info about working memory and agenda to the user
; before run

(printout t "============================================" crlf)
(printout t "Content of the working memory before run" crlf)

(facts)

(printout t "============================================" crlf)
(printout t "Activations on the agenda before run" crlf)

(agenda)

; run the program for step one

(printout t "============================================" crlf)
(printout t "run expert system one step - step 1" crlf)

(run 1)

; print out info about working memory and agenda to the user

(printout t "============================================" crlf)
(printout t "Content of the working memory after one step" crlf)

(facts)

(printout t "============================================" crlf)
(printout t "Activations on the agenda after one step" crlf)

(agenda)

; run the program for step two

(printout t "============================================" crlf)
(printout t "run expert system one step - step 2" crlf)

(run 1)

; print out info about working memory and agenda to the user

(printout t "============================================" crlf)
(printout t "Content of the working memory after one step" crlf)

(facts)

(printout t "============================================" crlf)
(printout t "Activations on the agenda after one step" crlf)

(agenda)

; run the program for step three

(printout t "============================================" crlf)
(printout t "run expert system one step - step 3" crlf)

(run 1)

; print out info about working memory and agenda to the user

(printout t "============================================" crlf)
(printout t "Content of the working memory after one step" crlf)

(facts)

(printout t "============================================" crlf)
(printout t "Activations on the agenda after one step" crlf)

(agenda)

; run the program for step four

(printout t "============================================" crlf)
(printout t "run expert system one step - step 4" crlf)

(run 1)

; print out info about working memory and agenda to the user

(printout t "============================================" crlf)
(printout t "Content of the working memory after one step" crlf)

(facts)

(printout t "============================================" crlf)
(printout t "Activations on the agenda after one step" crlf)

(agenda)
