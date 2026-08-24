/*
 * Copyright 2026 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


// This is a trial module. The functions here are experiments to see
// if the make writing code that invokes Java significantly more succinct.

// Versions of that `AdaptorExtras` combinators using the `Fail`` effect.
// Can it replace original `AdaptorExtras`?


pub mod JavaInterop.AdaptorExtras2 {

    use EffectExtras.Fail.Fail

    import java.lang.{Exception => JException}

    pub def of(f: Unit -> ToFlix.In[ans] \ ef + ToFlix.Aef[ans]): ans \ ef + Fail + ToFlix.Aef[ans] with ToFlix[ans] =
        try {
            let ans = f();
            Fail.assertNotNull(ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }


    pub def op(x: a, f: ToJava.Out[a] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans]): ans \ ef + Fail + ToJava.Aef[a] + ToFlix.Aef[ans] with ToJava[a], ToFlix[ans] = 
        try {
            let x1 = ToJava.toJava(x);
            let ans = f(x1);
            Fail.assertNotNull(ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }

    pub def op2(x: a, 
                y: b, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToFlix.Aef[ans]): ans \ ef + Fail + ToJava.Aef[a] + ToJava.Aef[b] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToFlix[ans] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let ans = f(x1, y1);
            Fail.assertNotNull(ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }
    
    pub def op3(x: a, 
                y: b, 
                z: c, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToFlix.Aef[ans]): ans \ ef + Fail + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToFlix[ans] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(x1, y1, z1);
            Fail.assertNotNull(ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }

    pub def op4(w: a,
                x: b, 
                y: c, 
                z: d, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToFlix.Aef[ans]): ans \ ef + Fail + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToFlix[ans] =
        try {
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(w1, x1, y1, z1);
            Fail.assertNotNull(ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }

    pub def extract(x: a, f: ToJava.Out[a] -> b \ ef + ToJava.Aef[a]): b \ ef + Fail + ToJava.Aef[a] with ToJava[a] =
        try {
            let x1 = ToJava.toJava(x);
            let ans = f(x1);
            Fail.returnNotNull(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }



    pub def extract2(x: a, y: b, f: ToJava.Out[a] -> ToJava.Out[b] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b]): ans \ ef + Fail + ToJava.Aef[a] + ToJava.Aef[b] with ToJava[a], ToJava[b] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let ans = f(x1, y1);
            Fail.returnNotNull(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }


    pub def extract3(x: a, y: b, z: c, f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c]): ans \ ef + Fail +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] with ToJava[a], ToJava[b], ToJava[c] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(x1, y1, z1);
            Fail.returnNotNull(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }

    pub def extract4(w: a, x: b, y: c, z: d, f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c]): ans \ ef + Fail +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] with ToJava[a], ToJava[b], ToJava[c], ToJava[d] =
        try {
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(w1, x1, y1, z1);
            Fail.returnNotNull(ans)
        } catch {
            case ex: JException => Fail.report(ex.getMessage())
        }

}

