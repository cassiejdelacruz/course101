SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 144
SQMETERS_TO_SQCENTIMETERS = 10000


puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

sq_meters = length * width
sq_feet = sq_meters * SQMETERS_TO_SQFEET
sq_inches = sq_feet * SQFEET_TO_SQINCHES
sq_centimeters = sq_meters * SQMETERS_TO_SQCENTIMETERS

puts "The area of the room is:"
puts "#{sq_meters} square meters" 
puts "#{sq_feet} square feet"
puts "#{sq_inches} square inches"
puts "#{sq_centimeters} square centimeters"