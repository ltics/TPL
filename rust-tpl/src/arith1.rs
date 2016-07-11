pub use self::Term::*;

#[allow(dead_code)]
#[derive(Clone, Debug, Eq, PartialEq)]
pub enum Term {
    True,
    False,
    If(Box<Term>, Box<Term>, Box<Term>),
    Zero,
    Succ(Box<Term>),
    Pred(Box<Term>),
    IsZero(Box<Term>)
}

pub fn isnumericval(t: Term) -> bool {
    match t {
        Zero => true,
        Succ(t1) => isnumericval(*t1),
        _ => false
    }
}

#[allow(dead_code)]
pub fn isval(t: Term) -> bool {
    match t {
        True => true,
        False => true,
        t => if isnumericval(t) {
            true
        } else {
            false
        }
    }
}

pub fn eval1(t: Term) -> Term {
    match t {
        If(box True, t2, _) => *t2,
        If(box False, _, t3) => *t3,
        If(t1, t2, t3) => {
            let t1_2 = box eval1(*t1);
            If(t1_2, t2, t3)
        }
        Succ(t1) => {
            let t1_2 = box eval1(*t1);
            Succ(t1_2)
        }
        Pred(t1) => match t1.clone() {
            box Zero => Zero,
            box Succ(v1) => if isnumericval(*v1) {
                *t1
            } else {
                Pred(t1)
            },
            _ => Pred(t1)
        },

        IsZero(box Zero) => True,
        IsZero(t1) => match t1.clone() {
            box Succ(v1) => if isnumericval(*v1) {
                False
            } else {
                let t1_2 = box eval1(*t1);
                IsZero(t1_2)
            },
            _ => {
                let t1_2 = box eval1(*t1);
                IsZero(t1_2)
            },
        },
        _ => panic!()
    }
}
