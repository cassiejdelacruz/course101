vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurences(array)
  vehicle_hash = {}

  array.each do |element|
    if vehicle_hash.has_key?(element)
      vehicle_hash[element] += 1
    else
      vehicle_hash[element] = 1
    end
  end

  vehicle_hash.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurences(vehicles)