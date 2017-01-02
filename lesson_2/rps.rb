VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "scissors" && second == "paper") ||
    (first == "paper" && second == "rock") ||
    (first == "rock" && second == "lizard") ||
    (first == "lizard" && second == "spock") ||
    (first == "spock" && second == "scissors") ||
    (first == "scissors" && second == "lizard") ||
    (first == "lizard" && second == "paper") ||
    (first == "paper" && second == "spock") ||
    (first == "spock" && second == "rock") ||
    (first == "rock"  && second == "scissors")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!! Best of 5 wins the game!!!")
  elsif win?(computer, player)
    prompt("Computer Won this round!! Best of 5 wins the game!!!")
  else
    prompt("It's a tie this round!!")
  end
end

choice = ""
choice_letter = ""
loop do
  you_win = 0
  computer_win = 0
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Type r for rock, p for paper, c for scissors, l for lizard, s for spock")
      choice_letter = gets.chomp.downcase
      choice = "rock" if choice_letter == "r"
      choice = "paper" if choice_letter == "p"
      choice = "scissors" if choice_letter == "c"
      choice = "lizard" if choice_letter == "l"
      choice = "spock" if choice_letter == "s"

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("you chose: #{choice}; Computer chose: #{computer_choice}")
    
    if win?(choice, computer_choice)
      you_win += 1
    elsif win?(computer_choice, choice)
      computer_win += 1
    else
    end

    if you_win == 5
      prompt("You are the winner of the game!!")
      break
    elsif computer_win == 5
      prompt("The computer is the winner of the game!!")
      break
    else
      display_results(choice, computer_choice)
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you playing. Goodbye!!")