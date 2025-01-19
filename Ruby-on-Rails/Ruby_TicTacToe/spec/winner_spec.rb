# frozen_string_literal: true

require_relative '../lib/winner'
require_relative '../lib/board'

RSpec.describe Winner do
  describe '#game_over?' do
    let(:winner) { Class.new { extend Winner } }
    let(:board) { double('board') }

    context 'when board is empty and turn count is 9' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@turn_count, 9)
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_game_over
      end
    end

    context 'when board is empty and turn count is 0 to 8' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        (0..8).each do |i|
          winner.instance_variable_set(:@turn_count, i)
          expect(winner).to_not be_game_over
        end
      end
    end

    context 'when all rows are hyphens' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to_not be_game_over
      end
    end

    context 'when first row is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['XXX', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when first row is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['OOO', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when second row is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['---', 'XXX', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when second row is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['---', 'OOO', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when third row is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', 'XXX'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when third row is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', 'OOO'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when first column is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['X--', 'X--', 'X--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when first column is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['O--', 'O--', 'O--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when second column is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['-X-', '-X-', '-X-'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when second column is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['-O-', '-O-', '-O-'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when third column is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['--X', '--X', '--X'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when third column is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['--O', '--O', '--O'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when leading diagonal is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['X--', '-X-', '--X'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when leading diagonal is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['O--', '-O-', '--O'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when non-leading diagonal is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['--X', '-X-', 'X--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end

    context 'when non-leading diagonal is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['--O', '-O-', 'O--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_game_over
      end
    end


    # TODO: 2 diagonals
  end

  describe '#horizontal?' do
    let(:winner) { Class.new { extend Winner } }
    let(:board) { double('board') }

    context 'when all rows are hyphens' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to_not be_horizontal
      end
    end

    context 'when first row is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['XXX', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_horizontal
      end
    end

    context 'when first row is O' do
      before do
        allow(board).to receive(:board_state).and_return(['OOO', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_horizontal
      end
    end

    context 'when second row is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['---', 'XXX', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_horizontal
      end
    end

    context 'when second row is O' do
      before do
        allow(board).to receive(:board_state).and_return(['---', 'OOO', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_horizontal
      end
    end

    context 'when third row is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', 'XXX'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_horizontal
      end
    end

    context 'when third row is O' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', 'OOO'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_horizontal
      end
    end
  end

  describe '#vertical?' do
    let(:winner) { Class.new { extend Winner } }
    let(:board) { double('board') }

    context 'when all columns are hyphens' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to_not be_vertical
      end
    end

    context 'when first column is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['X--', 'X--', 'X--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_vertical
      end
    end

    context 'when first column is O' do
      before do
        allow(board).to receive(:board_state).and_return(['O--', 'O--', 'O--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_vertical
      end
    end

    context 'when second column is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['-X-', '-X-', '-X-'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_vertical
      end
    end

    context 'when second column is O' do
      before do
        allow(board).to receive(:board_state).and_return(['-O-', '-O-', '-O-'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_vertical
      end
    end

    context 'when third column is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['--X', '--X', '--X'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_vertical
      end
    end
    context 'when third column is O' do
      before do
        allow(board).to receive(:board_state).and_return(['--O', '--O', '--O'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_vertical
      end
    end
  end

  describe '#diagonal?' do
    let(:winner) { Class.new { extend Winner } }
    let(:board) { double('board') }

    context 'when all diagonals are hyphens' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to_not be_vertical
      end
    end

    context 'when leading diagonal is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['X--', '-X-', '--X'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_diagonal
      end
    end

    context 'when leading diagonal is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['O--', '-O-', '--O'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_diagonal
      end
    end

    context 'when non-leading diagonal is Xs' do
      before do
        allow(board).to receive(:board_state).and_return(['--X', '-X-', 'X--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_diagonal
      end
    end

    context 'when non-leading diagonal is Os' do
      before do
        allow(board).to receive(:board_state).and_return(['--O', '-O-', 'O--'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to be_diagonal
      end
    end
  end

  describe '#same?' do
    let(:winner) { Class.new { extend Winner } }
    let(:board) { double('board') }

    context 'when values are the same and hyphens' do
      before do
        allow(board).to receive(:board_state).and_return(['---', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns false' do
        expect(winner).to_not be_same([0, 0], [0, 1], [0, 2])
      end
    end

    context 'when values are the same and not hyphens' do
      before do
        allow(board).to receive(:board_state).and_return(['XXX', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to be_same([0, 0], [0, 1], [0, 2])
      end
    end

    context 'when values are not the same' do
      before do
        allow(board).to receive(:board_state).and_return(['ABC', '---', '---'])
        winner.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        expect(winner).to_not be_same([0, 0], [0, 1], [0, 2])
      end
    end

  end
end
