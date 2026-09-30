/*
 *  Copyright 2026 Stephen Tetley
 *
 * Use of this source code is governed by the Apache 2.0 license
 * that can be found in the LICENSE.md file.
 */



// Versions of that original functions using the `Fail` effect.

// The original functions are more efficient if we know the Java they 
// invoke won't fail

pub mod AdaptorExtras.AdaptorChecked {

    use ee::EffectExtras.Fail.Fail
    use AdaptorExtras.InteropErr
    
    import java.lang.{Exception => JException}



    pub def of(f: Unit -> ToFlix.In[ans] \ ef + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToFlix.Aef[ans] with ToFlix[ans] =
        try {
            let ans = f();
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }


    pub def guarded(f: Unit -> a \ ef): a \ ef + Fail[InteropErr] = 
        try {
            let ans = f();
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch  {
            case ex : JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }


    pub def op(x: a, f: ToJava.Out[a] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToFlix.Aef[ans] with ToJava[a], ToFlix[ans] = 
        try {
            let x1 = ToJava.toJava(x);
            let ans = f(x1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def op2(x: a, 
                y: b, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToFlix[ans] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let ans = f(x1, y1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }
    
    pub def op3(x: a, 
                y: b, 
                z: c, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToFlix[ans] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(x1, y1, z1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def op4(w: a,
                x: b, 
                y: c, 
                z: d, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToFlix[ans] =
        try {
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(w1, x1, y1, z1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }


    pub def op5(v: a, 
                w: b,
                x: c, 
                y: d, 
                z: e, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToFlix[ans] =
        try {
            let v1 = ToJava.toJava(v);
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(v1, w1, x1, y1, z1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def op6(u: a,
                v: b, 
                w: c,
                x: d, 
                y: e, 
                z: f, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f], ToFlix[ans] =
        try {
            let u1 = ToJava.toJava(u);
            let v1 = ToJava.toJava(v);
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(u1, v1, w1, x1, y1, z1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def op7(t: a,
                u: b,
                v: c, 
                w: d,
                x: e, 
                y: f, 
                z: g, 
                f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ToJava.Out[g] -> ToFlix.In[ans] \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g] + ToFlix.Aef[ans]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g] + ToFlix.Aef[ans] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f], ToJava[g], ToFlix[ans] =
        try {
            let t1 = ToJava.toJava(t);
            let u1 = ToJava.toJava(u);
            let v1 = ToJava.toJava(v);
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(t1, u1, v1, w1, x1, y1, z1);
            Fail.assertNotNullWithFail(InteropErr.NullResult, ans);
            ToFlix.toFlix(ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }



    pub def extract(x: a, f: ToJava.Out[a] -> b \ ef + ToJava.Aef[a]): b \ ef + Fail[InteropErr] + ToJava.Aef[a] with ToJava[a] =
        try {
            let x1 = ToJava.toJava(x);
            let ans = f(x1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }



    pub def extract2(x: a, 
                    y: b, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] with ToJava[a], ToJava[b] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let ans = f(x1, y1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }


    pub def extract3(x: a, 
                    y: b, 
                    z: c, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c]): ans \ ef + Fail[InteropErr] +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] with ToJava[a], ToJava[b], ToJava[c] =
        try {
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(x1, y1, z1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def extract4(w: a, 
                    x: b, 
                    y: c, 
                    z: d, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d]): ans \ ef + Fail[InteropErr] +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] with ToJava[a], ToJava[b], ToJava[c], ToJava[d] =
        try {
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(w1, x1, y1, z1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }


    pub def extract5(v: a,
                    w: b, 
                    x: c, 
                    y: d, 
                    z: e, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e]): ans \ ef + Fail[InteropErr] +ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e] =
        try {
            let v1 = ToJava.toJava(v);
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(v1, w1, x1, y1, z1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def extract6(u: a, 
                    v: b,
                    w: c, 
                    x: d, 
                    y: e, 
                    z: f, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f] =
        try {
            let u1 = ToJava.toJava(u);
            let v1 = ToJava.toJava(v);
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(u1, v1, w1, x1, y1, z1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }

    pub def extract7(t: a, 
                    u: b, 
                    v: c,
                    w: d, 
                    x: e, 
                    y: f, 
                    z: g, 
                    f: ToJava.Out[a] -> ToJava.Out[b] -> ToJava.Out[c] -> ToJava.Out[d] -> ToJava.Out[e] -> ToJava.Out[f] -> ToJava.Out[g] -> ans \ ef + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g]): ans \ ef + Fail[InteropErr] + ToJava.Aef[a] + ToJava.Aef[b] + ToJava.Aef[c] + ToJava.Aef[d] + ToJava.Aef[e] + ToJava.Aef[f] + ToJava.Aef[g] with ToJava[a], ToJava[b], ToJava[c], ToJava[d], ToJava[e], ToJava[f], ToJava[g] =
        try {
            let t1 = ToJava.toJava(t);
            let u1 = ToJava.toJava(u);
            let v1 = ToJava.toJava(v);
            let w1 = ToJava.toJava(w);
            let x1 = ToJava.toJava(x);
            let y1 = ToJava.toJava(y);
            let z1 = ToJava.toJava(z);
            let ans = f(t1, u1, v1, w1, x1, y1, z1);
            Fail.returnNotNullWithFail(InteropErr.NullResult, ans)
        } catch {
            case ex: JException => Fail.report(InteropErr.Exception(ex.getMessage()))
        }


}

