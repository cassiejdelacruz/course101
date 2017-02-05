def ask_for_number(number)
  puts "Enter the #{number} number:"
end

def valid_number(num)
  loop do
    num = gets.chomp
    if num.to_i.to_s == num
        num.to_i
        break
    else
      puts "That's not a valid input. Please enter a number"
    end
  end
  num
end

def check_for_match(num, array)
  if array.include?(num)
    puts "The number #{num} appears in #{array}."
  else
    puts "The number #{num} does not appear in #{array}."
  end
end

numbers = []

ask_for_number("1st")
first_n = valid_number(first_n)
numbers << first_n

ask_for_number("2nd")
second_n = valid_number(second_n)
numbers << second_n

ask_for_number("3rd")
third_n = valid_number(third_n)
numbers << third_n

ask_for_number("4th")
fourth_n = valid_number(fourth_n)
numbers << fourth_n

ask_for_number("5th")
fifth_n = valid_number(fifth_n)
numbers << fifth_n

ask_for_number("6th")
sixth_n = valid_number(sixth_n)

check_for_match(sixth_n, numbers)
