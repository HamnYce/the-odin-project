module Enumerable
  # Your code goes here
  def my_each_with_index(&blk)
    counter = 0

    my_each do |el|
      blk.call(el, counter)
      counter += 1
    end

    self
  end

  def my_select(&blk)
    new_arr = []

    my_each do |el|
      new_arr << el if blk.call(el)
    end

    new_arr
  end

  def my_all?(&blk)
    my_each do |el|
      return false unless blk.call(el)
    end

    true
  end

  def my_any?(&blk)
    my_each do |el|
      return true if blk.call(el)
    end

    false
  end

  def my_none?(&blk)
    !my_any?(&blk)
  end

  def my_count(obj = (no_arg = true), &blk)
    count = 0
    if no_arg
      return length unless block_given?

      my_each { |el| count += 1 if blk.call(el) }
    else
      my_each { |el| count += 1 if el == obj }
    end
    count
  end

  def my_map(proc = nil, &blk)
    new_arr = []
    if !proc.nil?
      my_each { |el| new_arr << proc.call(el) }
    else
      my_each { |el| new_arr << blk.call(el) }
    end

    new_arr
  end

  def my_inject(initial, &blk)
    sum = initial
    my_each { |el| sum = blk.call(sum, el) }
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&blk)
    counter = 0

    while counter < length
      blk.call(self[counter])
      counter += 1
    end

    self
  end
end

def multiply_els(arr)
  p arr.my_inject(1) { |s, x| s * x }
end
