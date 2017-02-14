CHARS = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
          5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }

def signed_integer_to_string(integer)
  if integer > 0
    "+" + integer_to_string(integer)
  elsif integer < 0
    "-" + integer_to_string(integer.abs)
  else
    integer_to_string(integer)
  end
end

def integer_to_string(integer)
  chars = []
  loop do 
    if integer < 10
      chars << integer
      break
    end
    remainder = integer % 10
    integer = integer / 10
    chars << remainder   
  end

  chars.reverse!.map! { |n| CHARS[n] }
  chars.join
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'


# school solution
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end