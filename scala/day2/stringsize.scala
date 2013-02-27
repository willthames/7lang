val strings = List("this", "is", "a", "list", "of", "strings")

def StringsLength(x: List[String]):Int = { 
    return x.foldLeft(0)((sum, value) => sum + value.size)
}

println(StringsLength(strings))
