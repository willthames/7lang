List addSubLists := method(
    self map(x, x sum) sum
)

List2D := List clone do(
    lists ::= list()
)

List2D dim := method(x, y, 
    for(i, 1, y, 
        row := list()
        for (j, 1, x, 
            row append(0))
        lists append(row)
    )
)

List2D get := method(x, y, 
    lists at(y-1) at(x-1)
)

List2D set := method(x, y, z,
    lists at(y-1) atPut(x-1, z)
)   

List2D print := method(
    lists foreach(println)
)

List2D write := method(filename, 
    f := File with(filename)
    f remove
    f openForAppending  
    f write(self print)
    f close
)


list(list(1, 2, 3), list(4, 5, 6), list(7, 8, 9), list(10)) addSubLists println

list2d := List2D clone
list2d dim(3,4)
list2d set(1,1,1)
list2d set(3,1,2)
list2d get(3,1) println
list2d print
