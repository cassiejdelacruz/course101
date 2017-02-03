def is_odd?(integer)
  integer % 2 == 1
end

def is_odd?(number)
  number.remainder(2) == 1 ||
  number.remainder(2) == -1
end

p is_odd?(8)
p is_odd?(7)
p is_odd?(0)
p is_odd?(-4)
p is_odd?(-5)