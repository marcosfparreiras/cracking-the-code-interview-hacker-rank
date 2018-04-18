# frozen_string_literal: true

module Algorithms
  class MergeSort
    attr_reader :inversions_counter

    def initialize(array)
      @array = array
      @inversions_counter = 0
    end

    def sort
      mergesort(0, @array.size - 1)
    end

    private

    def mergesort(left_start, right_end)
      return if left_start >= right_end

      middle = (left_start + right_end) / 2
      mergesort(left_start, middle)
      mergesort(middle + 1, right_end)
      merge_halves(left_start, right_end)
      @array
    end

    def merge_halves(left_start, right_end)
      left_end = (left_start + right_end) / 2
      right_start = left_end + 1
      size = right_end - left_start + 1

      temp = Array.new(size)

      left = left_start
      right = right_start
      index = 0

      while left <= left_end && right <= right_end
        if @array[left] <= @array[right]
          temp[index] = @array[left]
          left += 1
        else
          temp[index] = @array[right]
          @inversions_counter += left_end - left + 1
          right += 1
        end
        index += 1
      end

      while right <= right_end
        temp[index] = @array[right]
        index += 1
        right += 1
      end

      while left <= left_end
        temp[index] = @array[left]
        index += 1
        left += 1
      end

      @array[left_start..right_end] = temp[0..size - 1]
    end
  end
end

# Answer on HackerRank
def count_inversions(arr)
  sorter = Algorithms::MergeSort.new(arr)
  sorter.sort
  sorter.inversions_counter
end

t = gets.strip.to_i
t.times do
  gets.strip.to_i
  arr = gets.strip
  arr = arr.split(' ').map(&:to_i)
  result = count_inversions(arr)
  puts result
end
