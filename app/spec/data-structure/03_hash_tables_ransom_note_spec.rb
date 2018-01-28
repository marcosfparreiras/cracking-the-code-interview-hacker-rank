# frozen_string_literal: true

require_relative '../../src/data-structures/03_hash_tables_ransom_note'

describe DataStructures::RansonNoteAnalyzer::WordsCounter do
  describe '#count_words' do
    let(:words) { %w[word one word two any other word two] }
    subject { described_class.new(words) }

    it 'returns a hash with words and occurrencies' do
      expected_result = {
        'word' => 3,
        'one' => 1,
        'two' => 2,
        'any' => 1,
        'other' => 1
      }
      expect(subject.count_words).to eq(expected_result)
    end
  end
end

describe DataStructures::RansonNoteAnalyzer do
  describe '#answer' do
    context 'when magazine has all ocurrencies for words' do
      let(:magazine_words) { %w[this was my note and this is my test] }
      let(:note_words) { %w[my note was my test] }
      subject { described_class.new(magazine_words, note_words) }

      it 'retuns Yes' do
        expect(subject.answer).to eq('Yes')
      end
    end

    context 'when magazine dos not have all ocurrencies for words' do
      let(:magazine_words) { %w[this was my note and this is a test] }
      let(:note_words) { %w[my note was my test] }
      subject { described_class.new(magazine_words, note_words) }

      it 'retuns No' do
        expect(subject.answer).to eq('No')
      end
    end
  end
end
