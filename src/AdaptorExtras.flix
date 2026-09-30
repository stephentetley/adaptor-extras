/*
 *  Copyright 2026 Stephen Tetley
 *
 * Use of this source code is governed by the Apache 2.0 license
 * that can be found in the LICENSE.md file.
 */


pub mod AdaptorExtras {

    use ee::EffectExtras.Fail

    pub enum InteropErr with Eq, Order, ToString {
        case NullArg
        case NullResult
        case Exception(String)
    }

    pub def reportException(msg: String): a \ Fail[InteropErr] = 
        Fail.report(InteropErr.Exception(msg))
    
    
}
