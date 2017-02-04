def age(name, default="Teddy")
  age = rand(20..200)
  if name.empty?
    name = default
  end
  puts "#{name} is #{age} years old"
end

puts "Please type a name"
name = gets.chomp
age(name)