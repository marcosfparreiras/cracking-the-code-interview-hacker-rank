# frozen_string_literal: true

require_relative '../../src/algorithms/03_merge_sort_counting_inversions'

describe Algorithms::MergeSort do
  let(:array1) { [1, 1, 1, 2, 2] }
  let(:sorted_array1) { [1, 1, 1, 2, 2] }

  let(:array2) { [2, 1, 3, 1, 2] }
  let(:sorted_array2) { [1, 1, 2, 2, 3] }

  let(:array3) { [6, 7, 2, 3, 1] }
  let(:sorted_array3) { [1, 2, 3, 6, 7] }

  subject { described_class.new(array) }

  describe '#sort' do
    it 'sorts the array 1' do
      sorter = described_class.new(array1)
      expect(sorter.sort).to eq(sorted_array1)
    end

    it 'sorts the array 2' do
      sorter = described_class.new(array2)
      expect(sorter.sort).to eq(sorted_array2)
    end

    it 'sorts the array 3' do
      sorter = described_class.new(array3)
      expect(sorter.sort).to eq(sorted_array3)
    end
  end

  describe '#inversions_counter' do
    it 'counts the number of inversions for array1' do
      sorter = described_class.new(array1)
      sorter.sort
      expect(sorter.inversions_counter).to eq(0)
    end

    it 'counts the number of inversions for array2' do
      sorter = described_class.new(array2)
      sorter.sort
      expect(sorter.inversions_counter).to eq(4)
    end

    it 'counts the number of inversions for array3' do
      sorter = described_class.new(array3)
      sorter.sort
      expect(sorter.inversions_counter).to eq(8)
    end
  end
end
