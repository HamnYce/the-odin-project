# frozen_string_literal: false

# board class contains all logic pertaining to the state, and behavior of the
# board. e.g. placing/updating the board
class Board
  attr_reader :board_state

  def initialize
    @board_state = %w[--- --- ---]
    puts 'this is the board'
  end

  def place_tic_tac(pos, sign)
    # pos[0] == row, pos[1] == col
    @board_state[pos[0] - 1][pos[1] - 1] = sign if valid_pos?(pos)
  end

  def valid_pos?(pos)
    row = pos[0].to_i.between?(1, 3)
    column = pos[1].to_i.between?(1, 3)

    row && column && empty_square?(pos, @board_state)
  end

  def empty_square?(pos, board_state)
    board_state[pos[0] - 1][pos[1] - 1] == '-'
  end

  def print_board
    # prints board with helpers for row and column.
    puts ' 123'
    (0..2).each do |i|
      print i + 1
      puts @board_state[i]
    end
  end
end
