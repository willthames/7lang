(import '(java.util.concurrent TimeUnit))
(def customers (atom 0))
; create queue of customers
(def queue (java.util.concurrent.LinkedBlockingQueue. 3))

(defn newcustomer []
  (swap! customers inc)
  (println "Attempting to add customer " @customers)
  (.offer queue @customers))


(defn generatecustomers []
  (repeat 5 (do
    (newcustomer) 
    (Thread/sleep (rand-int 300))
  ))
)


(defn nextcustomer []
  (let [cust (.poll queue 10 TimeUnit/SECONDS)]
    (println "Returning customer " cust)
    (cust)))

; (def q (seque (nextcustomer)))

; take customer from the queue and give haircut
;(future generatecustomers)
(generatecustomers)
(doseq [i (take 100 (repeatedly nextcustomer))])
