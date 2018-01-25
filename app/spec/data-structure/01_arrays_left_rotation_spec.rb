# frozen_string_literal: true

require_relative '../../src/data-structures/01_arrays_left_rotation'

describe DataStructures::ArrayLeftRotator do
  describe '#rotate' do
    let(:array) { [1, 2, 3, 4, 5] }
    let(:size) { 5 }

    context 'with 0 rotations' do
      let(:rotations) { 0 }
      subject { described_class.new(size, array, rotations) }
      it 'works' do
        expected_result = '1 2 3 4 5'
        expect(subject.rotate).to eq(expected_result)
      end
    end

    context 'with rotations smaller then array size' do
      let(:rotations) { 4 }
      subject { described_class.new(size, array, rotations) }
      it 'works' do
        expected_result = '5 1 2 3 4'
        expect(subject.rotate).to eq(expected_result)
      end
    end

    context 'with rotations greater then array size' do
      let(:rotations) { 7 }
      subject { described_class.new(size, array, rotations) }
      it 'works' do
        expected_result = '3 4 5 1 2'
        expect(subject.rotate).to eq(expected_result)
      end
    end
  end
end
