def oddities(arr)
  odd_elements = []
  counter = 0
  loop do 
    break if counter == arr.size
    if counter.even?
      odd_elements << arr[counter]
    end
    counter += 1
  end
  odd_elements
end

def oddities(arr)
  arr.select { |e| arr.index(e).even? }
end

def oddities(arr)
  odd_elements = []
  arr.each.with_index do |element, index|
    if index % 2 == 0 
      odd_elements << element
    end  
  end
  return odd_elements
end

p oddities([2, 3, 4, 5, 6])
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []