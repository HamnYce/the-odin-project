# frozen_string_literal:true

require_relative 'text'
require_relative 'winner'
require_relative 'board'

# Driver class acts as glue for all the different classes.
class Driver
  include Text
  include Winner

  attr_reader :turn_count, :sign

  def initialize
    @turn_count = 0
    @board = Board.new
  end

  def start
    print_title
    init_player_names
    print_intro_dialogue
    @board.print_board
    game_loop
  end

  def game_loop
    turn until game_over?

    end_game_statement(game_over?, current_player)
  end

  # use turn count to find current sign
  def turn
    @sign = @turn_count.even? ? 'X' : 'O'

    player_guess

    @board.print_board
    @turn_count += 1
  end

  def player_guess
    ask_position

    until @board.place_tic_tac([@row, @column], @sign)
      print_error_text
      ask_position
    end
  end

  def ask_position
    puts "Which row do you want to place the #{@sign} in?"
    @row = gets.chomp.to_i
    puts "Which column for the #{@sign}?"
    @column = gets.chomp.to_i
  end

  def current_player
    @sign == 'X' ? @player_one : @player_two
  end

  def init_player_names
    puts 'decide on player 1 with a game of rock, paper, scissors!'
    puts 'player 1 what\'s your name?'
    @player_one = gets.chomp
    puts 'and player 2?'
    @player_two = gets.chomp
  end
end
