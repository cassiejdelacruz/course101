puts "What is your name?"
name = gets.chomp!

if name.reverse.start_with?("!")
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end