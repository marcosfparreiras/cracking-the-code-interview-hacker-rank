# frozen_string_literal: true

module DataStructures
  class AnagramsAnalyzer
    class CharacterCounter
      def initialize(string)
        @string = string
      end

      def count_characters
        @string.chars.each_with_object({}) do |char, hsh|
          hsh[char] ||= 0
          hsh[char] += 1
        end
      end
    end

    def initialize(string1, string2)
      @string1_chars = CharacterCounter.new(string1).count_characters
      @string2_chars = CharacterCounter.new(string2).count_characters
    end

    def characters_to_remove
      all_unique_chars.inject(0) do |sum, char|
        sum + single_character_difference(char)
      end
    end

    private

    def all_unique_chars
      (@string1_chars.keys + @string2_chars.keys).uniq
    end

    def single_character_difference(char)
      (@string1_chars[char].to_i - @string2_chars[char].to_i).abs
    end
  end
end

# Answer on HackerRank
# puts DataStructures::AnagramsAnalyzer.new(a, b).characters_to_remove
