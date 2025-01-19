# frozen_string_literal: true

def stock_picker(stocks) 
  biggest_diff = 0
  # stock index 0 is lowest price index, stock_index 1 is highest price index
  stock_indeces = []

  stocks.each_with_index do |x, i|
    rest_of_stocks = stocks.values_at(i + 1..-1)

    rest_of_stocks.each_with_index do |y, j|
      if biggest_diff < (y - x)
        biggest_diff = (y - x) and stock_indeces = [i, (j + i + 1)]
      end
    end
  end
  return stock_indeces unless biggest_diff <= 0

  'Looks like it\'s a bullish market'
end
