require 'pry'
# use binding.pry to stop the program and inspect.
# > exit-program to exit from pry

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def joiner(arr, delimiter = ', ', final_separator = 'or')
	arr[-1] = "#{final_separator} #{arr.last}" if arr.size > 1
	arr.join(delimiter)
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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
# rubocop:enable Metrics/AbcSize#

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joiner(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not avalid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
  	 brd.select {|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
  	nil
  end
end

def computer_places_piece!(brd)
  square = nil
  
  WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
  end

  if !square
    WINNING_LINES.each do |line|
    square = find_at_risk_square(line,brd, PLAYER_MARKER)
    break if square
    end 
  end

  if !square && brd[5] == ' '
    square = 5
  elsif !square
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  player_score = 0
  computer_score = 0
  loop do
	  board = initialize_board
	  display_board(board)

	  loop do
	    display_board(board)
	    player_places_piece!(board)
	    break if someone_won?(board) || board_full?(board)
	    computer_places_piece!(board)
	    break if someone_won?(board) || board_full?(board)
	  end

	  display_board(board)

	  if ("#{detect_winner(board)}") == 'Player'
	  	player_score  = player_score + 1
	  elsif ("#{detect_winner(board)}") == 'Computer'
	  	computer_score = computer_score + 1
	  end

	  if player_score < 5 && computer_score < 5
	  prompt "Current Score is..."
      prompt "#{player_score} to #{computer_score}"
      prompt "Prepare for the next game in the series..."
      sleep(2)
      end

	  if player_score == 5
      prompt("Player Won Five Games! ... WAHOO!!")
      break
      elsif computer_score == 5
      prompt("Computer Won Five Games! ... OH NO!")
      break
    end
  end

  prompt "Play again? ( y or n )"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe!"
