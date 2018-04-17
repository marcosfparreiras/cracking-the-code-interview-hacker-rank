# frozen_string_literal: true

require_relative '../../src/algorithms/02_sorting_comparator'

describe Algorithms::QuickSort do
  let(:array) { [2, 6, 1, 8, 3, 6] }
  let(:ordered_array) { [1, 2, 3, 6, 6, 8] }
  subject { described_class.new(array) }

  describe '#sort' do
    it 'sorts the array' do
      expect(subject.sort).to eq(ordered_array)
    end
  end
end
