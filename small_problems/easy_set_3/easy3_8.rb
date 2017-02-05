def palindrome?(string)
  string == string.reverse
end

p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def palindrome?(array)
  array == array.reverse
end

p palindrome?([2, 3, 4, 5])
p palindrome?([2, 3, 3, 2])
p palindrome?([23, 33, 32])
p palindrome?([32, 32, 32])