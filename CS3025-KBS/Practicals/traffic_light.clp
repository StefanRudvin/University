; =========================================================
; traffic_light.clp
; =========================================================

; clear Jess

(clear)

; load the rule base

(batch "traffic_rules.clp")

; Initialise the working memory with observations

(assert (RED))

; Reset Jess to load the observations into working memory

(reset)

; show the content of working memory (facts list) and agenda

(facts)
(agenda)

; run the expert system

(run)

; check the working memory for the answer

(facts)
