# frozen_string_literal: true

module Algorithms
  class QuickSort
    def initialize(array)
      @array = array
    end

    def sort
      partial_sort(0, @array.size - 1)
    end

    private

    def partial_sort(left, right)
      return if left >= right
      pivot = (left + right) / 2
      idx = partition(left, right, pivot)
      partial_sort(left, idx - 1)
      partial_sort(idx, right)
      @array
    end

    def partition(left, right, pivot)
      while left <= right
        left += 1 while @array[left] < @array[pivot]
        right -= 1 while @array[right] > @array[pivot]

        next unless left <= right
        swap(@array, left, right)
        left += 1
        right -= 1
      end
      left
    end

    def swap(array, left, right)
      array[left], array[right] = array[right], array[left]
    end
  end
end

# Answer on HackerRank
# As Ruby wasn't an option for this challenge, the language used was Java 7
#
# // Write your Checker class here
# class Checker implements Comparator<Player>{
#     public int compare(Player a, Player b) {
#         if (a.score != b.score) {
#             return b.score - a.score;
#         }
#         return a.name.compareTo(b.name);
#     }
# }
