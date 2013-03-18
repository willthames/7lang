(def start (System/nanoTime))
(def haircuts (atom 0))  ; number of actual haircuts
(def customers (atom 0)) ; number of potential customers
(def opening-time-in-millis 1e5)
(def max-queue-length 3)

; create delay between min and max milliseconds
(defn customer-delay [min max] 
  (+ (rand-int (- max min)) min))

; return milliseconds elapsed since the start
(defn millis-elapsed []
  (/ (- (System/nanoTime) start) 1e6))

; to continue or not to continue
(defn not-finished [item] 
  (< (millis-elapsed) opening-time-in-millis))

; give a haircut and update the haircut counter
(defn haircut []
  (swap! haircuts inc)
  (println "Cutting hair " @haircuts)
  (Thread/sleep 200))

; create queue of customers
(def queue (java.util.concurrent.LinkedBlockingQueue. max-queue-length))

(defn generator []
     (swap! customers inc)
     (.offer queue @customers)
     (Thread/sleep (customer-delay 100 300))
     (.get queue)
     )

(def q (seque generator))

; take customer from the queue and give haircut
(doseq [i (take-while not-finished q)] 
  (println (millis-elapsed))
  (haircut)
  (println i ", (" (millis-elapsed) ")"))

