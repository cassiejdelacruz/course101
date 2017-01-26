WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = " ".freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
GOES_FIRST = %w(choose player computer).freeze

def prompt(string)
  puts "=> #{string}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array)
  if array.size > 1
    array.join(", ").insert(-2, "or ")
  elsif array.size == 2
    array.join(" or ")
  else
    array.join
  end
end

def who_goes_first(first_turn)
  first_turn = GOES_FIRST.sample

  if first_turn == "choose"
    choose_first_turn(first_turn)
  elsif first_turn == "player"
    return "player"
  else
    return "computer"
  end
end

def choose_first_turn(first_turn)
  loop do
    prompt "Who should take the first turn? Type p for player or c for computer"
    first_turn = gets.chomp.downcase

    if first_turn == "p"
      return "player"
    elsif first_turn == "c"
      return "computer"
    else
      prompt "That's not a valid choice. Please type p or c"
    end
  end
end

def place_piece(brd, current_player)
  player_picks(brd) if current_player == "player"
  computer_picks(brd) if current_player == "computer"
end

def player_picks(brd)
  square = ""
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_squares_at_risk(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_picks(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = computer_squares_at_risk(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = computer_squares_at_risk(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    else
      square = empty_squares(brd).sample
    end
  end

  brd[square] = COMPUTER_MARKER
end

def change_player(current_player)
  if current_player == "player"
    "computer"
  elsif current_player == "computer"
    "player"
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "Player"
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

first_turn = ""
current_player = ""
loop do
  prompt "Welcome to the Tic Tac Toe game!!"
  
  loop do
    player_score = 0
    computer_score = 0
    board = initialize_board
    first_turn = who_goes_first(first_turn)
    prompt "The #{first_turn} has the first pick!!"
    current_player = first_turn
    
    loop do
      display_board(board)
      place_piece(board, current_player)
      break if someone_won?(board) || board_full?(board)
      current_player = change_player(current_player)
    end

    display_board(board)
    system "cls"

    player_score += 1 if detect_winner(board) == "Player"
    computer_score += 1 if detect_winner(board) == "Computer"

    prompt "#{detect_winner(board)} won!" if someone_won?(board)
    prompt "it's a tie!" if board_full?(board)
    prompt "First to 5 wins the game!!"
    prompt "Current score: You #{player_score} and computer #{computer_score}"

    next unless player_score == 5 || computer_score == 5
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?("y")
  end
  break
end

prompt "Thansk for playing Tic Tac Toe!! Goodbye!!!"
