# Each player selects a hand (either rock, paper or scissors)
# Hands are compared and if players selected the same thing it it's a tie
# Otherwise p > r, r > s, s > p
class Player
  attr_accessor :name

  def initialize
  end

  def enter_name(who)
    puts "Enter name for the #{who}"
    name = gets.chomp
  end
end

class Hand
end

class PlayerHand < Hand
  attr_reader :player

  def initialize
    @player = Player.new.enter_name("player")
  end
  
  def pick_hand
    puts "#{player} picks hand"
  end
end

class ComputerHand < Hand
  attr_reader :computer

  def initialize
    @computer = Player.new.enter_name("computer")
  end

  def pick_hand
    puts "#{computer} picks hand"
  end
end

class Game
  attr_reader :player_hand, :computer_hand
  def initialize
    @player_hand = PlayerHand.new
    @computer_hand = ComputerHand.new
  end

  def play
    player_hand.pick_hand
    computer_hand.pick_hand
  end
end

game = Game.new.play