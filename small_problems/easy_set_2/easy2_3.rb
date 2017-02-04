puts "What is the bill total?"
bill_total = gets.chomp.to_f

puts "What is the tip percentage desired?"
tip_percent = gets.chomp.to_f

total_tip = bill_total * (tip_percent / 100)
bill_with_tip = bill_total + total_tip

tip_percent = sprintf("%0.02f", tip_percent.to_s)
total_tip = sprintf("%0.02f", total_tip.to_s)
bill_with_tip = sprintf("%0.02f", bill_with_tip.to_s)

puts "The tip for #{tip_percent}% is $#{total_tip}"
puts "The total bill with tip is $#{bill_with_tip}"