

pub mod Test01 {

    use Assert.{assertEq}
    use JavaInterop.AdaptorExtras

    import java.time.{LocalDate => JLocalDate}

    pub enum FlixLocalDate(JLocalDate)


    instance ToJava[FlixLocalDate] {
        type Out = JLocalDate
        pub def toJava(x: FlixLocalDate): JLocalDate = 
            let FlixLocalDate.FlixLocalDate(x1) = x;
            x1
    }

    instance ToFlix[FlixLocalDate] {
        type In = JLocalDate
        pub def toFlix(x: JLocalDate): FlixLocalDate = 
            FlixLocalDate.FlixLocalDate(x)
    }

    def printFlixLocalDate(d: FlixLocalDate): Unit \ IO = 
        let s = AdaptorExtras.extract(d, d1 -> unsafe IO { d1.toString() });
        println(s)

    @Test
    pub def test01(): Unit \ Assert + IO =
        let ans: FlixLocalDate = AdaptorExtras.of(() -> JLocalDate.now());
        printFlixLocalDate(ans);
        assertEq(expected = (), ())

}
