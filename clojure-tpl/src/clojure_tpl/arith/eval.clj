(ns clojure-tpl.arith.eval
  (require [adt.sweet :refer :all]
           [clojure-tpl.arith.ast :refer :all])
  (:refer-clojure :exclude [eval]))

(defn numeric-val?
  [term]
  (match term
    TmZero true
    (TmSucc term) (numeric-val? term)
    :else false))

(defn val?
  [term]
  (or (numeric-val? term)
      (match term
        TmTrue true
        TmFalse true
        :else false)))

(defn eval1
  "single step evaluation"
  [term]
  (match term
    (TmIf p c a) (match p
                   TmTrue c
                   TmFalse a
                   :else (TmIf (eval1 p) c a))
    (TmSucc term) (TmSucc (eval1 term))
    (TmPred term) (match term
                    TmZero TmZero
                    (TmSucc term) (when (numeric-val? term)
                                    term)
                    :else (TmPred (eval1 term)))
    (TmIsZero term) (match term
                      TmZero TmTrue
                      (TmSucc _) TmFalse
                      :else (TmIsZero (eval1 term)))
    :else (throw (Exception. "no rule applies"))))

(defn eval
  [term]
  (try
    (let [term (eval1 term)]
      (eval term))
    (catch Exception _ term)))
