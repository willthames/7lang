h = { a: 5, b: 7 }
arr = h.to_a
h2 = {}
arr.each_entry { |x| h2[x[0]] = x[1] }
h3 = Hash[*arr.flatten] 
h.each { |k, v| puts "#{k} = #{v}" }

%w(sets queues dequeues fifos).each { |s| puts "Arrays can model #{s}" }
