/*
 *  Copyright 2026 Stephen Tetley
 *
 * Use of this source code is governed by the Apache 2.0 license
 * that can be found in the LICENSE.md file.
 */


pub mod JavaInterop {


    pub enum InteropErr with Eq, Order, ToString {
        case NullArg
        case NullResult
        case Exception(String)
    }

    
}

