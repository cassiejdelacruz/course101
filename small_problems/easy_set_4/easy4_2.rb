def century(year)
  if year.to_s.size <= 2 || year == 100
    "1st"
  elsif year.to_s[-2, 2] == "00"
    year = year.to_s.slice!(0..-3) # delete last two numbers
    ending(year)
  else
    year = year.to_s.slice!(0..-3).to_i + 1
    year = year.to_s
    ending(year)
  end
end

def ending(year)
  if year[-2] == "1" && (year [-1] == "1" || year[-1] == "2" || year[-1] == "3")
    "#{year}th"
  elsif year[-1] == "1"
    "#{year}st"
  elsif year[-1] == "2"
    "#{year}nd"
  elsif year[-1] == "3"
    "#{year}rd"
  else
    "#{year}th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
