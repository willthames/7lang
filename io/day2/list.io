List myAverage := method(
    mySum := 0 
    myCount := 0
    while (self size > 0, 
        element := self pop
        e := try (
          mySum := mySum + element
          myCount := myCount + 1
        )
        e catch(Exception,
          (element .. " cannot be added to " .. mySum)
        )
    )
    mySum / myCount
)

list(4, 3, 2, 1) myAverage println
list("x", 7, "y", 2, "z") myAverage println
