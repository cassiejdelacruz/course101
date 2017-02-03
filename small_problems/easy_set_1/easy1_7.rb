def stringy(integer, start=1)
  start = 1 ? count = 0 : count = 1
  array = []
  loop do
    if count.even?
      array[count] = "1"
    elsif count.odd?
      array[count] = "0"
    end
    count += 1
    break if count == integer
  end
  array.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(5, 0)
puts stringy(8, 0)