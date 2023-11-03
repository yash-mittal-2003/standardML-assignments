// Q3

pub struct A {
    pub val : u32
}

/// This will have move semantics.
pub struct B {
    pub val : u32
}


/// See <https://doc.rust-lang.org/std/clone/trait.Clone.html>
impl Clone for A {
    fn clone(&self) -> A { *self }

}

/// See <https://doc.rust-lang.org/std/marker/trait.Copy.html>
impl Copy for A {}

fn main()
{

    let xa : A = A { val : 42 };
    let xb : B = B { val : 42 };

    let ya = xa;
    let yb = xb;

    println!("ya = A({0}), xa = A({1})", ya.val , xa.val);


    println!("yb = B({0})", yb.val);

    // println!("xb = B({})", x_b.val) // error move semantics for B

}
