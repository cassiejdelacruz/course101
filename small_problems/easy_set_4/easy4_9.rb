CHARS = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
          5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }

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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'