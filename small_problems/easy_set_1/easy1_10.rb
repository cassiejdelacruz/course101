def calculate_bonus(salary, boolean)
  bonus = 0
  if boolean == true
    bonue = salary / 2
  else 
    bonus
  end
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000