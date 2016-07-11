pub use self::Term::*;

#[derive(Debug,Clone)]
pub enum Term {
    True,
    False,
    If(Box<Term>, Box<Term>, Box<Term>),
    Zero,
    Succ(Box<Term>),
    Pred(Box<Term>),
    IsZero(Box<Term>)
}

pub fn is_numerical(t: &Term) -> bool {
    match *t {
        Zero => true,
        Succ(box ref t1) => is_numerical(t1),
        _ => false
    }
}

pub fn is_val(t: &Term) -> bool {
    match *t {
        True => true,
        False => true,
        _ => is_numerical(t)
    }
}

pub fn eval1(t: Term) -> Term {
    match t {
        Zero => Zero,
        If(box True, box t2, _) => t2,
        If(box False, _, box t3) => t3,
        If(box t1, t2, t3) => If(box eval1(t1), t2, t3),
        Succ(box t1) => Succ(box eval1(t1)),
        Pred(box Zero) => Zero,
        Pred(box Succ(box ref t1)) if is_numerical(t1) => t1.clone(),
        Pred(box t1) => Pred(box eval1(t1)),
        IsZero(box Zero) => True,
        IsZero(box Succ(box ref t1)) if is_numerical(t1) => False,
        IsZero(box t1) => IsZero(box eval1(t1)),
        _ => panic!()
    }
}
