require "yaml"
MESSAGES = YAML.load_file("mortgage_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

prompt(MESSAGES["welcome"])

prompt(MESSAGES["name"])

name = ""
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES["empty_name"])
  elsif /^[a-z]+$/i.match(name)
    break
  else
    prompt(MESSAGES["valid_name"])
  end
end

prompt(MESSAGES["hi"] + "#{name}!")

loop do
  loan_total = ""
  loop do
    prompt(MESSAGES["get_loan_total"])
    loan_total = gets.chomp
    if valid_integer?(loan_total)
      loan_total = loan_total.to_i
      break
    else
      prompt(MESSAGES["error_loan_total"])
    end
  end

  apr = ""
  loop do
    prompt(MESSAGES["get_APR"])
    apr = gets.chomp
    if valid_integer?(apr) || valid_float?(apr)
      break
    else
      prompt(MESSAGES["error_apr"])
    end
  end
  mpr = (apr.to_f / 12) / 100 # monthly percent rate

  loan_duration = ""
  duration_time = ""
  loop do
    prompt(MESSAGES["get_loan_duration"])
    loan_duration = gets.chomp
    if valid_integer?(loan_duration)
      loop do
        prompt(MESSAGES["duration_time"])
        duration_time = gets.chomp.downcase
        if duration_time == "y"
          loan_duration = loan_duration.to_i * 12
          break
        elsif duration_time == "m"
          loan_duration = loan_duration.to_i
          break
        else
          duration_time != "y" || duration_time != "m"
          prompt(MESSAGES["error_duration"])
        end
      end
      break
    else
      prompt(MESSAGES["error_loan_duration"])
    end
  end

  monthly_payment = loan_total * (mpr / (1 - (1 + mpr)**-loan_duration))
  monthly_payment = monthly_payment.round(2)

  prompt(MESSAGES["result"] + "$#{monthly_payment}!")

  prompt(MESSAGES["repeat"])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(MESSAGES["goodbye"] + " #{name}!!!")