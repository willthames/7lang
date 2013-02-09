def setup
    puts "Pick a number between 1 and 10"
    rand(10)+1
end

def guess(actual)
    answer = gets.to_i
    if (answer == actual)
        puts "Correct!!!"
        exit
    end
    puts "Higher" if answer < actual
    puts "Lower" if answer > actual
end

number = setup
while 1
    guess(number)
end
    
