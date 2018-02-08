# frozen_string_literal: true

module Algorithms
  class BubbleSort
    def initialize(array)
      @array = array
      @swaps = 0
    end

    def report
      sort
      report_lines.each { |line| puts line }
    end

    def sort
      is_sorted = false
      last_unsorted = @array.size - 1

      until is_sorted
        is_sorted = sorting_run(last_unsorted)
        last_unsorted -= 1
      end
      @array
    end

    def report_lines
      lines = []
      lines << "Array is sorted in #{@swaps} swaps."
      lines << "First Element: #{@array.first}"
      lines << "Last Element: #{@array.last}"
    end

    private

    def sorting_run(last_unsorted)
      is_sorted = true
      0.upto(last_unsorted - 1) do |i|
        next unless @array[i] > @array[i + 1]
        swap(i, i + 1)
        @swaps += 1
        is_sorted = false
      end
      is_sorted
    end

    def swap(i, j)
      tmp = @array[i]
      @array[i] = @array[j]
      @array[j] = tmp
    end
  end
end

# # Answer on HackerRank
# _ = gets.strip.to_i
# a = gets.strip
# a = a.split(' ').map(&:to_i)
# Algorithms::BubbleSort.new(a).report
