(1..99).select { |n| puts n if n.odd? }

(1..99).select do |n|
  if n % 2 == 1
    puts n
  end
end