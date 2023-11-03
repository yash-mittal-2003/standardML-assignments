// Q3

pub struct CopyStruct {
    pub val : u32
}


impl Clone for CopyStruct {
    fn clone(&self) -> CopyStruct { *self }

}

impl Copy for CopyStruct {}

fn main()
{

   let temp : CopyStruct = CopyStruct { val : 42 };
   
   let copied = temp;

    println!("copied = CopyStruct({0}), temp = CopyStruct({1})", copied.val , temp.val);

}
