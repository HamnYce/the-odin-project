# frozen_string_literal: true

require_relative '../lib/board'

RSpec.describe Board do
  subject(:board) { described_class.new }

  before do
    allow_any_instance_of(Board).to receive(:puts)
    allow_any_instance_of(Board).to receive(:print_board)
  end

  describe '#initialize' do
    # script method, test method inside is being called
  end

  describe '#place_tic_tac' do
    # command method, changes observable state
    # i.e. @board_state
    context 'when valid_pos is true' do
      before do
        allow(board).to receive(:valid_pos?).and_return(true)
      end

      it 'returns sign' do
        result = board.place_tic_tac([0, 0], 'X')
        expect(result).to eq('X')
      end

      it 'changes @board_state' do
        expect { board.place_tic_tac([0, 0], 'X') }.to change(board, :board_state)
      end
    end

    context 'when valid_pos is false' do
      before do
        allow(board).to receive(:valid_pos?).and_return(false)
      end

      it 'returns nil' do
        result = board.place_tic_tac([0, 0], 'X')
        expect(result).to be_nil
      end

      it 'does not change @board_state' do
        expect { board.place_tic_tac([0, 0], 'X') }.to_not change(board, :board_state)
      end
    end
  end

  describe '#valid_pos?' do
    # query, test observable state (@board_state)

    before do
      allow(board).to receive(:empty_square?).and_return(true)
    end

    context 'when pos is valid' do
      it 'returns true' do
        pos = [1, 3]
        expect(board).to be_valid_pos(pos)
      end
    end

    context 'when row is invalid' do
      it 'returns false' do
        pos = [6, 1]
        expect(board).to_not be_valid_pos(pos)
      end
    end

    context 'when column is invalid' do
      it 'returns false' do
        pos = [1, 6]
        expect(board).to_not be_valid_pos(pos)
      end
    end

    context 'when input is negative' do
      context 'when row is negative' do
        pos = [-1, 1]
        it 'returns false' do
          expect(board).to_not be_valid_pos(pos)
        end
      end

      context 'when column is negative' do
        pos = [1, -1]
        it 'returns false' do
          expect(board).to_not be_valid_pos(pos)
        end
      end
    end
  end

  describe '#empty_square?' do
    # query method, test the return value

    let(:pos) { [1, 1] }

    context 'when pos points to hyphen' do
      it 'returns true' do
        board_state = ['---', '---', '---']
        expect(board.empty_square?(pos, board_state)).to eq(true)
      end
    end

    context 'when pos points to number' do
      it 'returns false' do
        board_state = ['123', '---', '---']
        expect(board.empty_square?(pos, board_state)).to eq(false)
      end
    end

    context 'when pos points to letter' do
      it 'returns false' do
        board_state = ['abc', '---', '--']
        expect(board.empty_square?(pos, board_state)).to eq(false)
      end
    end

    context 'when pos points to empty space' do
      it 'returns false' do
        board_state = ['   ', '---', '--']
        expect(board.empty_square?(pos, board_state)).to eq(false)
      end
    end

   context 'when pos points to X' do
      it 'returns false' do
        board_state = ['XXX', '---', '--']
        expect(board.empty_square?(pos, board_state)).to eq(false)
      end
    end

    context 'when pos points to O' do
      it 'returns false' do
        board_state = ['OOO', '---', '--']
        expect(board.empty_square?(pos, board_state)).to eq(false)
      end
    end
  end
end
