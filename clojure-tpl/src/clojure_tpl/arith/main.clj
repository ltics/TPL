(ns clojure-tpl.arith.main
  (require [adt.sweet :refer :all]
           [clojure-tpl.arith.ast :refer :all]
           [clojure-tpl.arith.parser :refer :all]
           [clojure-tpl.arith.eval :refer :all])
  (:refer-clojure :exclude [eval]))

(defn run
  [input]
  (doseq [expr (parse input)]
    (let [output (match expr
                   (Eval term) (eval term))]
      (println (string-of-term output)))))

(defn repl
  []
  (do (print "λ ")
      (flush)
      (let [input (str (read-line))]
        (run input)
        (repl))))

(defn run-file
  [file-name]
  (-> file-name
      slurp
      run))