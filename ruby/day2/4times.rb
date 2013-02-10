def randomarray(n, max)
    a = (1..n).entries
    a.map! { rand(max) }
end

arr = randomarray(16,20)
counter = 1

arr.each do |x|
    print x
    print (counter % 4 != 0 ? " " : "\n")
    counter = counter + 1
end

arr.each_slice(4) do |x|
    print x.join(" "), "\n"
end
