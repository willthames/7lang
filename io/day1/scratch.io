(1 + 1) println
e := try(
  1 + 'one'
}
e catch(Exception,
  "Cannot invoke + method on 1 and 'one' - io is strongly typed" println
)
if (0, "zero is true", "zero is false") println
if ("", "empty string is true", "empty string is false") println
if (nil, "nil is true", "nil is false") println

Bobbins := Object clone
Bobbins slotNames println

Bobbins garbage := method ("this doesn't do much" println)
Bobbins slotNames println
Bobbins garbage

Bobbins garbage = method ("Overwrote garbage using =" println)
Bobbins garbage

Animal := Object clone do (
  say ::= nil
  legs ::= nil
  println := method ((type .. " has " .. legs  .. " legs and says " .. say) println)
)

Duck := Animal clone setSay("Quack!") setLegs(2)
Dog := Animal clone setSay("Woof!") setLegs(4)

Duck println
Dog println
