# frozen_string_literal: true

require_relative '../../src/algorithms/01_sorting_bubble_sort'

describe Algorithms::BubbleSort do
  let(:array) { [2, 6, 1, 8, 3, 6] }
  let(:ordered_array) { [1, 2, 3, 6, 6, 8] }
  subject { described_class.new(array) }

  describe '#sort' do
    it 'sorts the array' do
      expect(subject.sort).to eq(ordered_array)
    end
  end

  describe '#report_lines' do
    let(:report_swaps) { 'Array is sorted in 5 swaps.' }
    let(:first_element) { 'First Element: 1' }
    let(:last_element) { 'Last Element: 8' }
    let(:expected_report_lines) do
      [report_swaps, first_element, last_element]
    end

    before do
      subject.sort
    end

    it 'returns right report data' do
      expect(subject.report_lines).to eq(expected_report_lines)
    end
  end
end
