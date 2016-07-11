(ns clojure-tpl.untyped.ast
  (require [adt.sweet :refer :all]
           [letrec.sweet :refer :all]))

(defadt ::term
  TmTrue
  TmFalse
  TmZero
  (TmSucc term)
  (TmPred term)
  (TmIsZero term)
  (TmFloat value)
  (TmString value)
  (TmVar name-index ctx-length)
  (TmAbs name term)
  (TmApp lterm rterm)
  ;; just a list of name and term pairs
  (TmRecord name-terms)
  (TmProj term name)
  (TmTimesfloat lterm rterm)
  (TmIf predicate consequent alternative)
  (TmLet name term body))

(defadt ::bind
  NameBind
  (TmAbbBind term))

(defadt ::command
  (Eval term)
  (Bind name bind))

;; context

(def emptycontext [])

(def ctx-length count)

(defn put-top
  "put back on top of a stack"
  [h t]
  (-> h
      (cons t)
      vec))

(defn add-bind
  [ctx x bind]
  (put-top [x bind] ctx))

(defn get-bind
  [ctx i]
  (try
    (let [[_ bind] (nth ctx i)]
      bind)
    (catch Exception _ (throw (Exception. (format "Variabel lookup failure: %s" x))))))

(defn add-name
  [ctx x]
  (add-bind ctx x NameBind))

(defn name-bound?
  [ctx x]
  (if (or (empty? ctx) (nil? ctx))
    false
    (let [[[y _] & r] ctx]
      (if (= y x)
        true
        (name-bound? r x)))))

(defn pick-fresh-name
  [ctx x]
  (if (name-bound? ctx x)
    (pick-fresh-name ctx (str x "'"))
    [(put-top [x NameBind] ctx) x]))

(defn index-to-name
  [ctx x]
  (try
    (let [[xn _] (nth ctx x)]
      xn)
    (catch Exception _ (throw (Exception. (format "Variabel lookup failure: %s" x))))))

(defn name-to-index
  [ctx x]
  (if (or (empty? ctx) (nil? ctx))
    (throw (Exception. (str "Identifier " x " is unbound")))
    (let [[[y _] & r] ctx]
      (if (= y x)
        0
        (inc (name-to-index r x))))))

;; shifting

(defn tmmap
  [onvar c t]
  (letrec [walk (fn [c t]
                  (match t
                    (TmVar x n) (onvar c x n)
                    (TmAbs x b) (TmAbs x (walk (inc c) b))
                    (TmApp l r) (TmApp (walk c l) (walk c r))))]
    (walk c t)))

(defn term-shift-above
  [d c t]
  (tmmap (fn [c x n]
           (if (>= x c)
             (TmVar (+ x d) (+ n d))
             (TmVar x (+ n d))))
         c t))

(defn term-shift
  [d t]
  (term-shift-above d 0 t))

;; substitution

(defn term-subst
  [j s t]
  (tmmap (fn [c x n]
           (if (= x (+ j c))
             (term-shift c s)
             (TmVar x n)))
         0 t))

(defn term-subst-top
  [s t]
  (term-shift -1 (term-subst 0 (term-shift 1 s) t)))
