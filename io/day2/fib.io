Fib := Object clone
Fib fib := method(n,
  if(n==1, 1,
    if(n==2, 1, fib(n-1) + fib(n-2))
  )
)

Fib fib2 := method(n,
  ("calling fib2 " .. n) println
  if(n==1, 1,
    if(n==2, 1,
      curr := 1
      prev := 1
      for (i, 3, n, 
        curr = curr + prev
        prev = curr - prev
      )
      curr
    )
  )
)
  
Fib fib(10) println
Fib fib2(10) println
  
