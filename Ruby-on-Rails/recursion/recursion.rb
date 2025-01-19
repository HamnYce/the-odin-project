# Frozen_string_literal: true

def fibs(n)
  # prints n amount of fibonacci numbers iteratively
  first = 0
  second = 1
  n.times.each do |_x|
    print "#{first} "
    temp = second
    second = first + second
    first = temp
  end
end

def fibs_rec(n, first, second)
  return if n.zero?

  print  "#{first} "
  fibs_rec(n - 1, second, first + second)
  # prints n amount of fibonacci numbers recursively
end

def merge_sort(arr)
  return arr if arr.length == 1

  # joining algorithm
  l_arr = merge_sort(arr.slice!(0, arr.length / 2))
  r_arr = merge_sort(arr)
  sorted_arr = []

  until l_arr.empty? && r_arr.empty?
    sorted_arr << if r_arr.empty?
                    l_arr.shift
                  elsif l_arr.empty?
                    r_arr.shift
                  else
                    r_arr.first >= l_arr.first ? l_arr.shift : r_arr.shift
                  end
  end
  sorted_arr
end

worst_arr = 30.times.map { |x| 30 - x }
random_arr = 30.times.map { |_x| rand(30) + 1 }
random_arr2 = 30.times.map { |_x| rand(30) + 1 }

uts merge_sort(worst_arr).inspect
puts merge_sort(random_arr).inspect
puts merge_sort(random_arr2).inspect
