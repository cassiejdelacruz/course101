puts "Please write a word or multiple words:"
words = gets.chomp

characters = words.length - words.count(" ")
puts "There are #{characters} characters in '#{words}'."