//Q4

pub struct CopyStruct  {
    pub name : u32
}

impl Drop for CopyStruct
{
    fn drop (&mut self)
    {
	println!("{0} dies", self.name)

    }
}

fn main ()
{
    let x = CopyStruct { name : 10 };

    {
	let y = x;
	println!("\ty is {0}", y.name);
    }

    println!("out of brace")
}

