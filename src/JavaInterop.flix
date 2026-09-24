
pub mod JavaInterop {


    pub enum InteropErr with Eq, Order, ToString {
        case NullArg
        case NullResult
        case Exception(String)
    }

    
}
