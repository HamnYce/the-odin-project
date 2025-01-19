# frozen_string_literal: true

def bubble_sort(arr)
  not_sorted = true and search_size = arr.size
  while not_sorted
    not_sorted = false
    (1..search_size - 1).each do |i|
      # if first is greater than second
      if arr[i - 1] > arr[i]
        arr[i], arr[i - 1] = arr[i - 1], arr[i]
        not_sorted = true
      end
    end
    # optimisation: after each iteration the last element
    # will always be the largest
    search_size -= 1
  end
  arr
end

p bubble_sort(10.downto(0).to_a)
