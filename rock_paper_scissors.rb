class Player
  attr_accessor :name

  def initialize
  end

  def enter_name(who)
    puts "Please enter name for the #{who}:"
    name = gets.chomp
  end
end

class Hand
  def initialize
  end

  def display_message(which_player, choice)
    puts "#{which_player} picked #{Game::CHOICES[choice]}."
  end
end

class PlayerHand < Hand
  attr_reader :player

  def initialize
    @player = Player.new.enter_name("player")
  end
  
  def pick_hand
    while true
      puts "Choose one: (p/r/s)"
      choice = gets.chomp.downcase
      break if Game::CHOICES.keys.include? choice
    end
    choice
  end
end

class ComputerHand < Hand
  attr_reader :computer

  def initialize
    @computer = Player.new.enter_name("computer")
  end

  def pick_hand
    choice = Game::CHOICES.keys.sample 
  end
end

class Game
  attr_reader :player_hand, :computer_hand

  CHOICES = {"p" => "paper", "r" => "rock", "s" => "scissors"}

  def initialize
    @player_hand = PlayerHand.new
    @computer_hand = ComputerHand.new
  end

  def display_winning_message(winning_choice, winner, losing_choice, loser)
    case winning_choice
      when "p"
        puts "Paper wraps rock!"
      when "s"
        puts "Scissors cut through paper!"
      when "r"
        puts "Rock smashes scissors!"
    end
    puts "#{winner} wins!"
  end

  def compare_results(player, player_choice, computer, computer_choice)
    if computer_choice == player_choice
      puts "It's a tie!"
    elsif (player_choice == "p" && computer_choice == "r") || (player_choice == "s" && computer_choice == "p") || (player_choice == "r" && computer_choice == "s")
      display_winning_message(player_choice, player, computer_choice, computer)
    else 
      display_winning_message(computer_choice, computer, player_choice, player)
    end
  end

  def play
    while true
      player_choice = player_hand.pick_hand
      player_hand.display_message(player_hand.player, player_choice)
      computer_choice = computer_hand.pick_hand
      computer_hand.display_message(computer_hand.computer, computer_choice)
      compare_results(player_hand.player, player_choice, computer_hand.computer, computer_choice)

      puts "Play again? (y/n)"
      response = gets.chomp.downcase
      break if response != "y"
    end

    puts "Thank you! Bye!"
  end
end

game = Game.new.play
