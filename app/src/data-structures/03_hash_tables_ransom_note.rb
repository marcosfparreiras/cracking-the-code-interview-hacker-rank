# frozen_string_literal: true

module DataStructures
  class RansonNoteAnalyzer
    AFFIRMATIVE_ANSER = 'Yes'.freeze
    NEGATIVE_ANSER = 'No'.freeze

    class WordsCounter
      def initialize(words)
        @words = words
      end

      def count_words
        @words.each_with_object({}) do |word, hsh|
          hsh[word] ||= 0
          hsh[word] += 1
        end
      end
    end

    def initialize(magazine_words, note_words)
      @magazine_words_counted = WordsCounter.new(magazine_words).count_words
      @note_words_counted = WordsCounter.new(note_words).count_words
    end

    def answer
      can_make_note? ? AFFIRMATIVE_ANSER : NEGATIVE_ANSER
    end

    private

    def can_make_note?
      all_words.each do |word|
        return false unless magazine_has_all_occurencies_needed(word)
      end
      true
    end

    def all_words
      (@magazine_words_counted.keys + @note_words_counted.keys).uniq
    end

    def magazine_has_all_occurencies_needed(word)
      @magazine_words_counted[word].to_i >= @note_words_counted[word].to_i
    end
  end
end

# Answer on HackerRank
# puts DataStructures::RansonNoteAnalyzer.new(magazine, ransom).answer
