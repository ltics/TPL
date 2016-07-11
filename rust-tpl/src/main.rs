#![feature(box_syntax, box_patterns)]

mod arith1;
mod arith2;

#[test]
fn eval_to_true() {
    assert_eq!(arith1::eval1(arith1::IsZero(box arith1::Zero)), arith1::True);
}

#[test]
fn eval_to_false() {
    assert_eq!(arith1::eval1(arith1::IsZero(box arith1::Succ(box arith1::Zero))), arith1::False)
}

#[test]
fn arith2_test() {
    assert_eq!(format!("{:?}", arith2::True), "True");
    assert_eq!(arith2::is_numerical(&arith2::True), false);
    assert_eq!(arith2::is_numerical(&arith2::Zero), true);
    assert_eq!(arith2::is_val(&arith2::True), true);
    assert_eq!(arith2::is_val(&arith2::If(box arith2::True,box arith2::True,box arith2::False)), false);
    assert_eq!(format!("{:?}", arith2::eval1(arith2::If(box arith2::True,box arith2::True,box arith2::False))), "True");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::If(box arith2::False,box arith2::True,box arith2::False))), "False");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::If(box arith2::IsZero(box arith2::Zero), box arith2::True, box arith2::False))), "If(True, True, False)");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::Succ(box arith2::Succ(box arith2::Zero)))), "Succ(Succ(Zero))");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::Pred(box arith2::Zero))), "Zero");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::Pred(box arith2::Succ(box arith2::Zero)))), "Zero");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::Pred(box arith2::Succ(box arith2::Zero)))), "Zero");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::IsZero(box arith2::Zero))), "True");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::IsZero(box arith2::Succ(box arith2::Zero)))), "False");
    assert_eq!(format!("{:?}", arith2::eval1(arith2::IsZero(box arith2::Pred(box arith2::Succ(box arith2::Zero))))), "IsZero(Zero)");
}

fn main() {
}
