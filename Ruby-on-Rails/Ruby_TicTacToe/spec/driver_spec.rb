# frozen_string_literal: true

require_relative '../lib/driver'
require_relative '../lib/board'

RSpec.describe Driver do
  subject(:driver) { described_class.new }

  before do
    allow_any_instance_of(Board).to receive(:puts)
  end

  describe '#initialize' do
    # only creating instance variables, does not need to be tested
  end

  # TODO: create test for start method
  # TODO: Mock Board to test the print board call in start
  describe '#start' do
    # public script method
    # test the methods inside
  end

  describe '#game_loop' do
    # Looping script method
    # test behaviour
    # test behaviour stops when conditions are met
    # test output message (i.e. the behavior when condition is met)

    before do
      allow(driver).to receive(:turn)
      allow(driver).to receive(:end_game_statement).with(true, 'X')
    end

    context 'when condition is false once then true' do
      before do
        allow(driver).to receive(:game_over?).and_return(false, true)
      end

      it 'calls #turn once then #end_game_statement' do
        expect(driver).to receive(:turn).once
        expect(driver).to receive(:end_game_statement)
        driver.game_loop
      end
    end

    context 'when condition is false two times then true' do
      before do
        allow(driver).to receive(:game_over?).and_return(false, false, true)
      end

      it 'calls #turn twice then #end_game_statement' do
        expect(driver).to receive(:turn).twice
        expect(driver).to receive(:end_game_statement)
        driver.game_loop
      end
    end
  end

  describe '#player_guess' do
    let(:board_placement) { double('board') }

    before do
      allow(driver).to receive(:ask_position)
      allow(driver).to receive(:print_error_text)
      allow(board_placement).to receive(:place_tic_tac).and_return(false, true)
      driver.instance_variable_set(:@board, board_placement)
    end

    context 'when invalid guess is entered once' do
      it 'calls #ask_position twice' do
        expect(driver).to receive(:ask_position).twice
        driver.player_guess
      end
    end
  end

  describe '#turn' do
    let(:board_print) { double('board', print_board: nil) }

    before do
      allow(driver).to receive(:player_guess)
      driver.instance_variable_set(:@board, board_print)
    end

    context 'when called' do
      it '@turn_count changes by +1' do
        expect { driver.turn }.to change(driver, :turn_count).by(1)
      end
    end

    context 'when turn count is even' do
      before do
        driver.instance_variable_set(:@turn_count, 2)
      end

      it '@sign is X' do
        driver.turn
        expect(driver.sign).to eq('X')
      end
    end

    context 'when turn count is odd' do
      before do
        driver.instance_variable_set(:@turn_count, 1)
      end

      it '@sign is O' do
        driver.turn
        expect(driver.sign).to eq('O')
      end
    end
  end

  describe '#current_player' do
    # no need to test
  end

  describe '#ask_position' do
    # No need to test
  end

  describe '#init_player_names' do
    # No need to test
  end
end
