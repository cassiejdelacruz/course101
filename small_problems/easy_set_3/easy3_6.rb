def xor?(n1, n2)
  if n1 == true && n2 == true
    false
  elsif n1 == true || n2 == true
    true
  else
    false
  end
end
    

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false