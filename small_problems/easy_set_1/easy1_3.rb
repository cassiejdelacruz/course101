def digit_list(integer)
  integer.to_s.chars.map { |digit| digit.to_i }
end

puts digit_list(1405) == [1, 4, 0, 5]