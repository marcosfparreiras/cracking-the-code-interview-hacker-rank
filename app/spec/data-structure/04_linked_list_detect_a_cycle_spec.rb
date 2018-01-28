# frozen_string_literal: true

require_relative '../../src/data-structures/04_linked_list_detect_a_cycle'

describe DataStructures::LikedList::Node do
  let(:node1) { described_class.new(19) }
  let(:node2) { described_class.new(42, node1) }

  it 'has data' do
    expect(node2.data).to eq(42)
  end

  it 'has next' do
    expect(node2.next).to eq(node1)
  end
end

describe DataStructures::LikedList do
  it 'initializes with head as nil' do
    expect(described_class.new.head).to eq(nil)
  end

  describe '#append' do
    context 'when the list is empty' do
      let(:list) { described_class.new }

      it 'initializes list with node as head' do
        list.append(23)
        expect(list.head.data).to eq(23)
      end
    end

    context 'when the list is not empty' do
      let(:list) { described_class.new }
      before do
        list.append(1)
        list.append(2)
        list.append(3)
      end

      it 'appends element to end of list' do
        node1 = list.head
        node2 = node1.next
        node3 = node2.next
        expect(node3.data).to eq(3)
      end
    end
  end

  describe '#last' do
    context 'when the list is empty' do
      let(:list) { described_class.new }

      it 'returns nil' do
        expect(list.last).to eq(nil)
      end
    end

    context 'when the list is not empty' do
      let(:list) { described_class.new }
      before do
        list.append(1)
        list.append(2)
        list.append(3)
      end

      it 'returns the last node' do
        node1 = list.head
        node2 = node1.next
        node3 = node2.next
        expect(list.last).to eq(node3)
      end
    end
  end

  describe '#empty' do
    context 'when the list is empty' do
      let(:list) { described_class.new }

      it 'returns true' do
        expect(list.empty?).to eq(true)
      end
    end

    context 'when the list is not empty' do
      let(:list) { described_class.new }
      before do
        list.append(1)
        list.append(2)
        list.append(3)
      end

      it 'returns false' do
        expect(list.empty?).to eq(false)
      end
    end
  end

  describe '#find_by_value' do
    context 'when the list is empty' do
      let(:list) { described_class.new }

      it 'returns true' do
        expect(list.find_by_value(2)).to eq(nil)
      end
    end

    context 'when the list is not empty' do
      let(:list) { described_class.new }
      before do
        list.append(1)
        list.append(2)
        list.append(3)
      end

      it 'returns false' do
        node1 = list.head
        node2 = node1.next
        expect(list.find_by_value(2)).to eq(node2)
      end
    end
  end

  describe '#cycle??' do
    context 'when the list is empty' do
      let(:list) { described_class.new }

      it 'returns true' do
        expect(list.cycle?).to eq(false)
      end
    end

    context 'when the list is not empty' do
      context 'and the list has cycle' do
        let(:list) { described_class.new }
        before do
          list.append(1)
          list.append(2)
          list.append(3)
          node2 = list.find_by_value(2)
          node3 = list.find_by_value(3)
          node3.next = node2
        end

        it 'returns true' do
          expect(list.cycle?).to eq(true)
        end
      end

      context 'and the list does not have cycle' do
        let(:list) { described_class.new }
        before do
          list.append(1)
          list.append(2)
          list.append(3)
        end

        it 'returns false' do
          expect(list.cycle?).to eq(false)
        end
      end
    end
  end
end
