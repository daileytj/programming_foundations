require 'pry'

SUITS = ['Heart', 'Diamond', 'Spade', 'Club'].freeze
CARDS = ['A', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARDS.product(SUITS).shuffle
end

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You Busted! Dealer Wins!"
  when :dealer_busted
    prompt "Dealer Busted! You Win!"
  when :player
    prompt "You Win!"
  when :dealer
    prompt "Dealer Wins!"
  when :tie
    prompt "It's a Tie"
  end
end

def grand_output (dealer_cards, player_cards)
  puts "==============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "==============="

  display_result(dealer_cards, player_cards)
end

def play_again?
  puts "---------------"
  prompt "Do you want to play again?"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt "Welcome to Twenty-One!"

  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
  prompt "Shuffling Cards..."
  sleep(1)
  prompt "..."
  sleep(1)
  print "=> ."
  sleep(1)
  print "."
  sleep(1)
  print "."
  puts " "
  prompt "The dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]} for a total of #{total(player_cards)}."

  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must ennter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    grand_output(dealer_cards,player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  prompt "Dealer Turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= 17

    prompt "Dealer Hits!"
    dealer_cards << deck.pop
    prompt "Dealers cards are now #{dealer_cards}"
  end

  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    grand_output(dealer_cards,player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  grand_output(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good Bye!"

# ====================
#        BONUS
# ====================

# 1)
# We cant replace all calls to total with a local variable because the variable changes throughout
# the programand we need to recalculate the total everytime it is changed.

# 2)
# The last call to play again is different from the previous two because the previous two have a if next else break clause
# where as if the player does not want to play again we break and if they do the loop restarts.

# 3)
# We can extract the method and get a grand output in each place where the round ends.
# We just have to remember to add two parameters calling in the players cards and the dealers cards.
