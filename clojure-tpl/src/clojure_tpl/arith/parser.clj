(ns clojure-tpl.arith.parser
  (require [clj-antlr.core :as antlr]
           [instaparse.core :as insta]
           [adt.sweet :refer :all]
           [clojure-tpl.arith.ast :refer :all]))

(def parser (antlr/parser "resources/arith.g4"))

(defn parse-int
  [n]
  (if (zero? n)
    TmZero
    (TmSucc (parse-int (dec n)))))

(defn parse
  [stream]
  (->> (antlr/parse parser stream)
       vec
       (insta/transform {:file  (fn [& args] (first args))
                         :top   (fn [& args]
                                  (let [[tm & top] args]
                                    (-> (Eval tm)
                                        (cons top)
                                        vec)))
                         :term  (fn [& args]
                                  (condp = (count args)
                                    ;; if term
                                    6 (let [[_ p _ c _ a] args]
                                        (TmIf p c a))
                                    ;; ( term )
                                    3 (let [[_ tm _] args]
                                        tm)
                                    2 (let [[op tm] args]
                                        (condp = op
                                          "succ" (TmSucc tm)
                                          "pred" (TmPred tm)
                                          "iszero" (TmIsZero tm)))
                                    1 (first args)))
                         :atom  identity
                         :int   #(parse-int (Integer/parseInt %))
                         :true  (fn [_] TmTrue)
                         :false (fn [_] TmFalse)})
       flatten
       (filter #(not= ";" %))
       vec))
