mygcd a b 
  | a == 0 = b
  | a > b = mygcd (mod a b) b
  | b > a = mygcd (mod b a) a
