class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false

  end

  def play
    until @game_over == true
      self.take_turn
    end

    if @game_over == true
      self.game_over_message
      self.reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    
    @seq.each do |color|
      sleep 0.5
      puts color
      sleep 1
      system("clear")
      sleep 0.5
    end
  end

  def require_sequence
    #prompt
    puts "Guess the sequence:"

    @seq.each do |color|
      color_guess = gets.chomp
      if color != color_guess
        @game_over = true 
        break
      end
    end

  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Round complete!"
  end

  def game_over_message
    puts "Game over. You made it #{@sequence_length - 1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
