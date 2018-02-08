# frozen_string_literal: true

path = '../../src/data-structures/07_trees_is_this_a_binary_search_tree'
require_relative path

describe DataStructures::BinaryTree::Node do
  subject { described_class.new(10) }

  describe '#insert' do
    context 'when value is smaller then data' do
      before do
        subject.insert(5)
      end

      context 'on first level' do
        it 'inserts into left node' do
          expect(subject.left.data).to eq(5)
        end
      end
      context 'on deeper levels' do
        it 'inserts into left side' do
          subject.insert(7)
          expect(subject.left.right.data).to eq(7)
        end
      end
    end

    context 'when value is greater then data' do
      before do
        subject.insert(15)
      end

      context 'on first level' do
        it 'inserts into right node' do
          expect(subject.right.data).to eq(15)
        end
      end

      context 'on deeper levels' do
        it 'inserts into right side' do
          subject.insert(17)
          expect(subject.right.right.data).to eq(17)
        end
      end
    end
  end

  describe '#contains' do
    before do
      subject.insert(2)
      subject.insert(14)
      subject.insert(17)
      subject.insert(6)
    end

    context 'when tree has the element' do
      it 'returns true' do
        expect(subject.contains?(17)).to be_truthy
      end
    end

    context 'when tree does not have the element' do
      it 'returns false' do
        expect(subject.contains?(13)).to be_falsy
      end
    end
  end

  describe '#to_a' do
    before do
      subject.insert(2)
      subject.insert(14)
      subject.insert(17)
      subject.insert(6)
      subject.insert(5)
      subject.insert(15)
      subject.insert(6)
      subject.insert(99)
      subject.insert(19)
    end

    let(:expected_return) { [2, 5, 6, 6, 10, 14, 15, 17, 19, 99] }

    it 'returns array with ordered values' do
      expect(subject.to_a).to eq(expected_return)
    end
  end
end

describe DataStructures::BstChecker do
  let(:root) { DataStructures::GenericNode.new(50) }

  context 'when elements are in order' do
    context 'when has repeated elements' do
      before do
        root_left = DataStructures::GenericNode.new(14)
        root_right = DataStructures::GenericNode.new(67)
        root.left = root_left
        root.right = root_right

        root_left_left = DataStructures::GenericNode.new(12)
        root_left_right = DataStructures::GenericNode.new(14)
        root_left.left = root_left_left
        root_left.right = root_left_right

        root_right_left = DataStructures::GenericNode.new(55)
        root_right_right = DataStructures::GenericNode.new(70)
        root_right.left = root_right_left
        root_right.right = root_right_right
      end

      it 'returns false' do
        expect(described_class.bst?(root)).to eq(false)
      end
    end

    context 'when has only unique elements' do
      before do
        root_left = DataStructures::GenericNode.new(14)
        root_right = DataStructures::GenericNode.new(67)
        root.left = root_left
        root.right = root_right

        root_left_left = DataStructures::GenericNode.new(12)
        root_left_right = DataStructures::GenericNode.new(16)
        root_left.left = root_left_left
        root_left.right = root_left_right

        root_right_left = DataStructures::GenericNode.new(55)
        root_right_right = DataStructures::GenericNode.new(70)
        root_right.left = root_right_left
        root_right.right = root_right_right
      end

      it 'returns true' do
        expect(described_class.bst?(root)).to eq(true)
      end
    end
  end

  context 'when elements are not in order' do
    before do
      root_left = DataStructures::GenericNode.new(14)
      root_right = DataStructures::GenericNode.new(67)
      root.left = root_left
      root.right = root_right

      root_left_left = DataStructures::GenericNode.new(12)
      root_left_right = DataStructures::GenericNode.new(16)
      root_left.left = root_left_left
      root_left.right = root_left_right

      root_right_left = DataStructures::GenericNode.new(55)
      root_right_right = DataStructures::GenericNode.new(30)
      root_right.left = root_right_left
      root_right.right = root_right_right
    end
    it 'returns false' do
      expect(described_class.bst?(root)).to eq(false)
    end
  end
end
