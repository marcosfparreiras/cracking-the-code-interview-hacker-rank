# frozen_string_literal: true

module DataStructures
  class BaseHeap
    attr_accessor :items

    def initialize(type = :min)
      @items = []

      case type
      when :min
        @op = :<
        @reverse_op = :>
      when :max
        @op = :>
        @reverse_op = :<
      end
    end

    def peek
      @items[0]
    end

    def poll
      item = @items[0]
      @items[0] = @items.pop
      heapify_down
      item
    end

    def add(item)
      @items << item
      heapify_up
    end

    def size
      @items.size
    end

    private

    def heapify_down
      idx = 0
      while has_left_child(idx)
        selected_child_idx = left_children_index(idx)
        if has_right_child(idx) && right_child(idx).send(@op, left_child(idx))
          selected_child_idx = right_children_index(idx)
        end

        break if @items[idx].send(@op, @items[selected_child_idx])
        swap(idx, selected_child_idx)
        idx = selected_child_idx
      end
    end

    def heapify_up
      idx = size - 1
      while has_parent(idx) && parent(idx).send(@reverse_op, @items[idx])
        parent_idx = parent_index(idx)
        swap(parent_idx, idx)
        idx = parent_idx
      end
    end

    def swap(index_a, index_b)
      swapped = @items[index_b]
      @items[index_b] = @items[index_a]
      @items[index_a] = swapped
    end

    def left_children_index(parent_index)
      2 * parent_index + 1
    end

    def right_children_index(parent_index)
      2 * parent_index + 2
    end

    def parent_index(child_index)
      (child_index - 1) / 2
    end

    def has_left_child(index)
      left_children_index(index) < size
    end

    def has_right_child(index)
      right_children_index(index) < size
    end

    def has_parent(index)
      parent_index(index) >= 0
    end

    def left_child(index)
      @items[left_children_index(index)]
    end

    def right_child(index)
      @items[right_children_index(index)]
    end

    def parent(index)
      @items[parent_index(index)]
    end
  end

  class MinHeap < BaseHeap
    def initialize
      super(:min)
    end
  end

  class MaxHeap < BaseHeap
    def initialize
      super(:max)
    end
  end

  class MedianCalculator
    def initialize(values_array)
      @numbers_array = values_array
      @lowers = MaxHeap.new
      @highers = MinHeap.new
    end

    def perform
      medians = []
      @numbers_array.each do |number|
        add_value(number)
        rebalance
        medians << calculate_median
      end
      medians
    end

    private

    def add_value(number)
      if @lowers.size == 0 || number < @lowers.peek
        @lowers.add(number)
      else
        @highers.add(number)
      end
    end

    def rebalance
      biggerHeap = @lowers.size > @highers.size ? @lowers : @highers
      smallerHeap = @lowers.size < @highers.size ? @lowers : @highers

      if biggerHeap.size - smallerHeap.size >= 2
        smallerHeap.add(biggerHeap.poll)
      end
    end

    def calculate_median
      biggerHeap = @lowers.size > @highers.size ? @lowers : @highers
      smallerHeap = @lowers.size > @highers.size ? @highers : @lowers

      if biggerHeap.size == smallerHeap.size
        sum = biggerHeap.peek + smallerHeap.peek
        (sum / 2.0).round(1)
      else
        biggerHeap.peek.round(1)
      end
    end
  end
end

# # Answer on HackerRank
# #!/bin/ruby
# n = gets.strip.to_i
# array = []
# n.times do
#   array << gets.strip.to_i
# end
# medians = DataStructures::MedianCalculator.new(array).perform
# medians.each { |m| puts m }
