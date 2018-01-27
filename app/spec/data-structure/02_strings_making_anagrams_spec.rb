# frozen_string_literal: true

require_relative '../../src/data-structures/02_strings_making_anagrams'

describe DataStructures::AnagramsAnalyzer::CharacterCounter do
  describe '#count_characters' do
    let(:string) { 'anyexample' }
    subject { described_class.new(string) }

    it 'returns a hash with characters and occurrencies' do
      expected_result = {
        'a' => 2,
        'n' => 1,
        'y' => 1,
        'e' => 2,
        'x' => 1,
        'm' => 1,
        'p' => 1,
        'l' => 1
      }
      expect(subject.count_characters).to eq(expected_result)
    end
  end
end

describe DataStructures::AnagramsAnalyzer do
  describe '#characters_to_remove' do
    context 'when s1 and s2 have the same characters' do
      let(:string1) { 'abcdab' }
      let(:string2) { 'abcdabd' }
      subject { described_class.new(string1, string2) }

      it 'works' do
        expect(subject.characters_to_remove).to eq(1)
      end
    end

    context 'when s1 has more distinct characters then s2' do
      let(:string1) { 'abaacdeff' }
      let(:string2) { 'ade' }
      subject { described_class.new(string1, string2) }

      it 'works' do
        expect(subject.characters_to_remove).to eq(2 + 1 + 1 + 2)
      end
    end

    context 'when s2 has more distinct characters then s1' do
      let(:string1) { 'ade' }
      let(:string2) { 'abaacdeff' }
      subject { described_class.new(string1, string2) }

      it 'works' do
        expect(subject.characters_to_remove).to eq(2 + 1 + 1 + 2)
      end
    end
  end
end
