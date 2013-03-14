(defn big [st n] (> (.length st) n))

(defn collection-type [col] (
  (def colmap {"class clojure.lang.PersistentList" :list,
               "class clojure.lang.PersistentArrayMap", :map,
               "class clojure.lang.PersistentVector", :vector,
               "class clojure.lang.PersistentHashSet", :set})
  (def result (colmap (.toString (class col))))
  (if result
    result
    (class col))
))

(println (big "wow this string isn't that big" 150))
(println (big "this string is very big, apparently", 12))

(println (collection-type {:a :b, :c :d}))
(println (collection-type #{:a :b :c :d}))
(println (collection-type '(:a :b :c :d)))
(println (collection-type [:a :b :c :d]))

