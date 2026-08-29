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



pub mod JavaInterop.AdaptorUnchecked {

    import java.lang.{Exception => JException}

    pub def op(x: a, f: ToJava.Out[a] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToFlix.Aef[ans] with ToJava[a], ToFlix[ans] =
        let x1 = ToJava.toJava(x);
        let ans = f(x1);
        ToFlix.toFlix(ans)

    pub def opWithResult(x: a, f: ToJava.Out[a] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans]): Result[String, ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans] with ToJava[a], ToFlix[ans] = 
        try {
            let x1 = ToJava.toJava(x);
            let ans = f(x1);
            Ok(ToFlix.toFlix(ans))
        } catch {
            case ex: JException => Err(ex.getMessage())
        }

    pub def opWithOption(x: a, f: ToJava.Out[a] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans]): Option[ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans] with ToJava[a], ToFlix[ans] = 
        try {
            let x1 = ToJava.toJava(x);
            let ans = f(x1);
            if (not Object.isNull(ans)) Some(ToFlix.toFlix(ans)) else None
        } catch {
            case _: JException => None
        }

    pub def op2(x: a, 
                y: b, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToFlix[ans] =
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let ans = f(x1, y1);
        ToFlix.toFlix(ans)
    
    pub def op3(x: a, 
                y: b, 
                z: c, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToFlix[ans] =
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        let ans = f(x1, y1, z1);
        ToFlix.toFlix(ans)

    pub def op4(w: a,
                x: b, 
                y: c, 
                z: d, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToFlix[ans] =
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        let ans = f(w1, x1, y1, z1);
        ToFlix.toFlix(ans)

    pub def op5(v: a, 
                w: b,
                x: c, 
                y: d, 
                z: e, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToFlix[ans] =
        let v1 = ToJava.toJava(v);
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        let ans = f(v1, w1, x1, y1, z1);
        ToFlix.toFlix(ans)

    pub def op6(u: a,
                v: b, 
                w: c,
                x: d, 
                y: e, 
                z: f, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f], ToFlix[ans] =
        let u1 = ToJava.toJava(u);
        let v1 = ToJava.toJava(v);
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        let ans = f(u1, v1, w1, x1, y1, z1);
        ToFlix.toFlix(ans)

    pub def op7(t: a,
                u: b,
                v: c, 
                w: d,
                x: e, 
                y: f, 
                z: g, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ToJava.Out[g] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g] + ToFlix.Aef[ans]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f], ToJava[g], ToFlix[ans] =
        let t1 = ToJava.toJava(t);
        let u1 = ToJava.toJava(u);
        let v1 = ToJava.toJava(v);
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        let ans = f(t1, u1, v1, w1, x1, y1, z1);
        ToFlix.toFlix(ans)




    pub def of(f: Unit -> ToFlix.In[ans] \ ef + ToFlix.Aef[ans]): ans \ ef + ToFlix.Aef[ans] with ToFlix[ans] =
        let ans = f();
        ToFlix.toFlix(ans)

    pub def ofWithResult(f: Unit -> ToFlix.In[ans] \ ef + ToFlix.Aef[ans]): Result[String, ans] \ ef + ToFlix.Aef[ans] with ToFlix[ans] =
        try {
            let ans = f();
            if (not Object.isNull(ans)) Ok(ToFlix.toFlix(ans)) else Err("ofWithResult-null")
        } catch {
            case ex: JException => Err(ex.getMessage())
        }

    pub def ofWithOption(f: Unit -> ToFlix.In[ans] \ ef + ToFlix.Aef[ans]): Option[ans] \ ef + ToFlix.Aef[ans] with ToFlix[ans] =
        try {
            let ans = f();
            if (not Object.isNull(ans)) Some(ToFlix.toFlix(ans)) else None
        } catch {
            case _: JException => None
        }

    // No need for higher arity versions of `of` (obviously)

    pub def extract(x: a, f: ToJava.Out[a] -> ans \ ef + ToJava.Aef[a]): ans \ ef + ToJava.Aef[a] with ToJava[a] =
        let x1 = ToJava.toJava(x);
        f(x1)

    pub def extractWithResult(x: a, f: ToJava.Out[a] -> b \ ef + ToJava.Aef[a]): Result[String, b] \ ef + ToJava.Aef[a] with ToJava[a] =
        try {
            let x1 = ToJava.toJava(x);
            Ok(f(x1))
        } catch {
            case ex: JException => Err(ex.getMessage())
        }

    pub def extractWithOption(x: a, f: ToJava.Out[a] -> b \ ef + ToJava.Aef[a]): Option[b] \ ef + ToJava.Aef[a] with ToJava[a] =
        try {
            let x1 = ToJava.toJava(x);
            Some(f(x1))
        } catch {
            case _: JException => None
        }

    // special case detecting null string
    pub def extractStringWithOption(x: a, f: ToJava.Out[a] -> String \ ef + ToJava.Aef[a]): Option[String] \ ef + ToJava.Aef[a] with ToJava[a] =
        try {
            let x1 = ToJava.toJava(x);
            let str = f(x1);
            if (not Object.isNull(str)) Some(str) else None

        } catch {
            case _: JException => None
        }

    // special case detecting null string
    pub def extractStringWithResult(x: a, f: ToJava.Out[a] -> String \ ef + ToJava.Aef[a]): Result[String, String] \ ef + ToJava.Aef[a] with ToJava[a] =
        try {
            let x1 = ToJava.toJava(x);
            let str = f(x1);
            if (not Object.isNull(str)) Ok(str) else Err("extractStringWithResult(null)")

        } catch {
            case _: JException => Err("extractStringWithResult")
        }

    pub def extract2(x: a, y: b, f: ToJava.Out[a] -> ToJava.Out[b] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] with ToJava[a], ToJava[b] =
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        f(x1, y1)

    pub def extract3(x: a, y: b, z: c, f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] with ToJava[a], ToJava[b], ToJava[c] =
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        f(x1, y1, z1)

    pub def extract4(w: a, 
                    x: b, 
                    y: c, 
                    z: d, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d]): ans \ ef +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] with ToJava[a], ToJava[b], ToJava[c], ToJava[d] =
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        f(w1, x1, y1, z1)

    pub def extract5(v: a,
                    w: b, 
                    x: c, 
                    y: d, 
                    z: e, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e]): ans \ ef +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e] =
        let v1 = ToJava.toJava(v);
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        f(v1, w1, x1, y1, z1)

    pub def extract6(u: a, 
                    v: b,
                    w: c, 
                    x: d, 
                    y: e, 
                    z: f, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f] =
        let u1 = ToJava.toJava(u);
        let v1 = ToJava.toJava(v);
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        f(u1, v1, w1, x1, y1, z1)

    pub def extract7(t: a, 
                    u: b, 
                    v: c,
                    w: d, 
                    x: e, 
                    y: f, 
                    z: g, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ToJava.Out[g] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g]): ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f], ToJava[g] =
        let t1 = ToJava.toJava(t);
        let u1 = ToJava.toJava(u);
        let v1 = ToJava.toJava(v);
        let w1 = ToJava.toJava(w);
        let x1 = ToJava.toJava(x);
        let y1 = ToJava.toJava(y);
        let z1 = ToJava.toJava(z);
        f(t1, u1, v1, w1, x1, y1, z1)



}

