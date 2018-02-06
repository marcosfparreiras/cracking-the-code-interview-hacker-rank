# frozen_string_literal: true

require_relative '../../src/data-structures/08_heaps_find_the_running_median'

describe DataStructures::MinHeap do
  subject { described_class.new }

  before do
    subject.add(5)
    subject.add(2)
    subject.add(3)
    subject.add(7)
    subject.add(4)
    subject.add(1)
    subject.add(6)
  end

  describe '#add' do
    it 'adds elements keeping the min heap order' do
      expect(subject.items).to eq([1, 4, 2, 7, 5, 3, 6])
    end
  end

  describe '#poll' do
    it 'removes peak element keeping the min heap order' do
      subject.poll
      expect(subject.items).to eq([2, 4, 3, 7, 5, 6])
    end
  end

  describe '#peek' do
    it 'returns the smaller element on the heap' do
      expect(subject.peek).to eq(1)
    end
  end
end

describe DataStructures::MaxHeap do
  subject { described_class.new }

  before do
    subject.add(5)
    subject.add(2)
    subject.add(3)
    subject.add(7)
    subject.add(4)
    subject.add(1)
    subject.add(6)
  end

  describe '#add' do
    it 'adds elements keeping the max heap order' do
      expect(subject.items).to eq([7, 5, 6, 2, 4, 1, 3])
    end
  end

  describe '#poll' do
    it 'removes peak element keeping the max heap order' do
      subject.poll
      expect(subject.items).to eq([6, 5, 3, 2, 4, 1])
    end
  end

  describe '#peek' do
    it 'returns the smaller element on the heap' do
      expect(subject.peek).to eq(7)
    end
  end
end

describe DataStructures::MedianCalculator do
  describe '#perform' do
    let(:values) { [12, 4, 5, 3, 8, 7] }
    let(:expected_results) { [12.0, 8.0, 5.0, 4.5, 5.0, 6.0] }
    subject { described_class.new(values) }

    it 'returns medians for each new element element' do
      expect(subject.perform).to eq(expected_results)
    end
  end
end
