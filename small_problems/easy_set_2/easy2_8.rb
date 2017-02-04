puts "Please enter an integer greater than 0:"
integer = ""

loop do 
  integer = gets.chomp
  if integer.to_i.to_s == integer
    integer = integer.to_i
    break
  else
    puts "Please enter a valid integer greater than 0:"
  end
end

puts "Enter 's' to compute the sum, 'p' to compute the product."

loop do 
  choice = gets.chomp
  if choice == 's'
    sum = (1..integer).reduce(:+)
    puts "The sum of the integers between 1 and #{integer} is #{sum}"
    break
  elsif choice == 'p'
    product = (1..integer).reduce(:*)
    puts "The product of the integers between 1 and #{integer} is #{product}"
    break
  else
    puts "That's not a valid choice.  Please type 's' or 'p'"
  end
end

