(ns clojure-tpl.core
  (require [adt.sweet :refer :all]
           [clojure-tpl.arith.main :as arith]))

(defn -main
  [& args]
  (let [prog (first args)
        file ((apply hash-map (drop 1 args)) "-f")]
    (match [prog file]
      ["arith" nil] (arith/repl)
      ["arith" file] (arith/run-file file))))
