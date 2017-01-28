VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_COMBOS = {
  "scissors" => %w(paper lizard),
  "paper" => %w(rock spock),
  "rock" => %w(lizard scissors),
  "lizard" => %w(spock paper),
  "spock" => %w(scissors rock)
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
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
      prompt("Type r for rock, p for paper, c for scissors,
        l for lizard, s for spock")
      choice_letter = gets.chomp.downcase
      letter_options = {
        "r" => "rock",
        "p" => "paper",
        "c" => "scissors",
        "l" => "lizard",
        "s" => "spock"
      }

      if letter_options.key?(choice_letter)
        choice = letter_options[choice_letter]
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
    end

    if you_win == 5
      prompt("You have won 5 rounds and are the winner of the game!!")
      break
    elsif computer_win == 5
      prompt("The computer won 5 rounds and is the winner of the game!!")
      break
    else
      display_results(choice, computer_choice)
      prompt("Current score is you have won #{you_win} rounds and
        the computer has won #{computer_win} rounds")
      choice = ""
      choice_letter = ""
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you playing. Goodbye!!")