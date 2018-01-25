# frozen_string_literal: true

module DataStructures
  class ArrayLeftRotator
    def initialize(size, array, rotations)
      @size = size
      @array = array
      @rotations = rotations % size
    end

    def rotate
      unless @rotations.zero?
        rotated_elements = save_rotated_elements
        rotate_from_beginning
        append_rotated_elements(rotated_elements)
      end
      format_output
    end

    private

    def save_rotated_elements
      rotated_elements = Array.new(@rotations) { nil }
      @array[0..@rotations - 1].each_with_index do |element, index|
        rotated_elements[index] = element
      end
      rotated_elements
    end

    def rotate_from_beginning
      @new_array = Array.new { @size - @rotations }
      @array[@rotations..-1].each_with_index do |element, index|
        @new_array[index] = element
      end
      @array = @new_array
    end

    def append_rotated_elements(rotated_elements)
      rotated_elements.each_with_index do |element, index|
        @array[@size - @rotations + index] = element
      end
    end

    def format_output
      @array.join(' ')
    end
  end
end

# Answer on HackerRank
# puts ArrayLeftRotator.new(n, a, k).rotate
