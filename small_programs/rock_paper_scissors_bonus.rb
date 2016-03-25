VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def translate_choice(first_letter)
  case first_letter
  when 'r' || 'ro' || 'rock'
    return 'rock'
  when 'p' || 'pa' || 'paper'
    return 'paper'
  when 's' || 'sc' || 'scissors'
    return 'scissors'
  when 'l' || 'li' || 'lizard'
    return 'lizard'
  when 'sp' || 'spock'
    return 'spock'
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("It's A Tie!")
  end
end

def increment(winner, loser)
  if win?(winner, loser)
    return "player wins"
  elsif win?(loser, winner)
    return "computer wins"
  end
end

player_score = 0
computer_score = 0
prompt("Welcome To Rock, Paper, Scissors, Lizard, Spock!")
prompt("Choose wisely, the first to 5 wins.")
loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp().downcase()

      choice = translate_choice(choice)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{choice}; Computer chose: #{computer_choice}")
    display_results(choice, computer_choice)

    if increment(choice, computer_choice) == "player wins"
      player_score += 1
    elsif increment(choice,computer_choice) == "computer wins"
      computer_score += 1
    end

    if player_score == 5
      prompt("You Won Five Games! ... WAHOO!!")
      break
    elsif computer_score == 5
      prompt("Computer Won Five Games! ... OH NO!")
      break
    end
  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end


prompt("Thank you for playing. Goodbye!")
