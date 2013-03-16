;; Macro definition
(defmacro unless [test body else?]
  (list 'if (list 'not test) body else?))


;; ---- TESTS ----
(unless true (println "False") (println "True"))

(println (unless (> 5 3) "weird - 5 should be greater than 3" "phew - 5 is greater than 3"))
