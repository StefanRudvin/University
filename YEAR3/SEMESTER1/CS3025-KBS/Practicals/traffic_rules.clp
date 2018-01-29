; ============================================================================
; traffic_rules.clp
; ============================================================================

; Define the rules of your expert system


(defrule R1
  (RED)
  =>
  (assert (YELLOW))
)

(defrule R2
  (RED)
  (YELLOW)
  =>
  (retract (RED))
  (retract (YELLOW))
  (assert (GREEN))
)

(defrule R3
  (GREEN)
  =>
  (retract (GREEN))
  (assert (YELLOW))
)

(defrule R4
  (YELLOW)
  (not (RED))
  =>
  (retract (YELLOW))
  (assert (RED))
)
