(ns clojure-tpl.arith.ast
  (require [adt.sweet :refer :all]))

(defadt ::term
  TmTrue
  TmFalse
  TmZero
  (TmSucc term)
  (TmPred term)
  (TmIsZero term)
  (TmIf predicate consequent alternative))

(defadt ::command
  (Eval term))

(defn string-of-term
  [term]
  (match term
    TmTrue "true"
    TmFalse "false"
    TmZero "0"
    (TmSucc term) (format "(succ %s)"
                          (string-of-term term))
    (TmPred term) (format "pred %s"
                          (string-of-term term))
    (TmIsZero term) (format "iszero %s"
                            (string-of-term term))
    (TmIf p c a) (format "if %s then %s else %s"
                         (string-of-term p)
                         (string-of-term c)
                         (string-of-term a))))
