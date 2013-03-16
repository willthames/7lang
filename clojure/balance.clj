(def accounts (ref []))

(defn open [balance] 
  (dosync (alter accounts concat [(ref balance)]))
  (- (count @accounts) 1))

(defn credit [account amount] (dosync (alter (nth @accounts account) + amount)))
;; (defn debit [x] (dosync (alter balance - x)))
(defmacro debit [account amount] (list 'credit account (- amount)))

(defn balance [account] (deref (nth @accounts account)))

;; --- TESTS --- 

(def firstacct (open 50))
(def secondacct (open 100))

(println (balance firstacct))
(println (balance secondacct))

(credit firstacct 50)
(println (balance firstacct))
(debit secondacct 5)
(println (balance secondacct))
