VALUES = %w(2 3 4 5 6 7 8 9 10 JACK QUEEN KING ACE).freeze
SUITS = %w(Clubs Diamonds Hearts Spades).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  prompt "---------------------------------"
  prompt "Welcome to the Twenty One Game!!!"
  prompt "---------------------------------"
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def deal_cards(deck, card)
  card = deck.sample
  deck.delete(card)
end

def display_p_cards(p_cards)
  prompt "You have:"
  prompt "-------------"
  p_cards.each { |card| prompt "#{card[0]} of #{card[1]}" }
  prompt "-------------"
end

def display_d_before_player_stay(d_cards)
  prompt "Dealer has:"
  prompt "-------------"
  prompt "#{d_cards[0][0]} of #{d_cards[0][1]} and one other card"
  prompt "-------------"
end

def display_d_after_player_stay(d_cards)
  prompt "Dealer has:"
  prompt "-------------"
  d_cards.each { |card| prompt "#{card[0]} of #{card[1]}" }
  prompt "-------------"
end

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == "ACE"
      sum += 11
    elsif value.to_i.zero? # for Jack, Quenn, King
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "ACE" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def display_total_p(_total, p_cards)
  prompt "-----------------"
  prompt "Your total is: #{total(p_cards)}"
  prompt "-----------------"
end

def display_total_d(_total, d_cards)
  prompt "-----------------"
  prompt "Dealer total is: #{total(d_cards)}"
  prompt "-----------------"
end

def busted?(_total, cards)
  total(cards) > 21
end

player_cards = []
dealer_cards = []
hit_or_stay = nil
card = nil
loop do
  welcome
  deck = initialize_deck
  player_cards = Array.new(2) { |_| deal_cards(deck, card) }
  dealer_cards = Array.new(2) { |_| deal_cards(deck, card) }
  display_p_cards(player_cards)
  display_d_before_player_stay(dealer_cards)
  display_total_p(total(player_cards), player_cards)

  loop do
    prompt "Would you like to 'hit' or 'stay'?"
    hit_or_stay = gets.chomp.downcase

    if hit_or_stay == "hit"
      player_cards << deal_cards(deck, card)
      display_p_cards(player_cards)
      prompt "After that 'hit'!"
      display_total_p(total(player_cards), player_cards)
    elsif hit_or_stay == "stay"
      prompt "You chose to 'stay'!"
    else
      prompt "That's not a valid choice. Choose 'hit' or 'stay'"
    end
    break if hit_or_stay == "stay" || busted?(total(player_cards), player_cards)
  end

  if hit_or_stay == "stay"
    display_total_p(total(player_cards), player_cards)
    prompt "Dealer now shows all cards"
    display_d_after_player_stay(dealer_cards)
    display_total_d(total(dealer_cards), dealer_cards)
  end

  loop do
    break if total(dealer_cards) >= 17 ||
             busted?(total(player_cards), player_cards) ||
             busted?(total(dealer_cards), dealer_cards)
    next unless total(dealer_cards) < 17
    prompt "The dealer total is less than 17, the dealer will 'hit'"
    dealer_cards << deal_cards(deck, card)
    prompt "After that 'hit'!"
    display_d_after_player_stay(dealer_cards)
    display_total_d(total(dealer_cards), dealer_cards)
  end

  if busted?(total(player_cards), player_cards)
    prompt "You BUSTED! Dealer Wins!!!"
  elsif busted?(total(dealer_cards), dealer_cards)
    prompt "Dealer BUSTED! You Win!!!"
  elsif total(player_cards) > total(dealer_cards)
    prompt "You win!!!"
  elsif total(player_cards) < total(dealer_cards)
    prompt "Dealer wins! Better luck next time!!!"
  end

  prompt "Would you like to play again? (y or n)"
  play_again = gets.chomp.downcase
  break unless play_again.start_with?("y")
end

prompt "Thanks for playing the Twenty One Game! Goodbye!!!"
