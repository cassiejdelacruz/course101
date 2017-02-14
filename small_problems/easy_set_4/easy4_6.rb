def running_total(array)
  new_array = []
  count1 = 0
  count2 = 1
  new_array << array[0]

  loop do
    break if count2 == array.size 
    if array.empty?
      return array
    end
    new_array << ((new_array[count1].to_i) + (array[count2].to_i))
    count1 += 1
    count2 += 1
  end

  new_array
end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []