# frozen_string_literal: true

require_relative '../../src/data-structures/06_queues_a_tale_of_two_stacks'

describe DataStructures::Queue::Stack do
  subject { described_class.new }

  it 'works' do
    expect(true).to eq(true)
  end

  describe '#empty?' do
    it 'returns true when empty' do
      expect(subject.empty?).to eq(true)
    end

    it 'returns false when not empty' do
      node = DataStructures::Queue::Stack::Node.new(1)
      subject.instance_variable_set(:@top, node)
      expect(subject.empty?).to eq(false)
    end
  end

  describe '#push' do
    it 'updates top value' do
      subject.push(12)
      expect(subject.instance_variable_get(:@top).data).to eq(12)
    end
  end

  describe '#peak' do
    it 'retrieves top value' do
      subject.push(12)
      expect(subject.peak).to eq(12)
    end
  end

  describe '#pop' do
    before do
      subject.push(13)
      subject.push(17)
    end
    it 'returns peak value' do
      expect(subject.pop).to eq(17)
    end

    it 'removes last node from stack' do
      expect { subject.pop }.to change {
        subject.instance_variable_get(:@top).data
      }.from(17).to(13)
    end
  end
end

describe DataStructures::Queue do
  subject { described_class.new }

  describe '#enqueue' do
    it 'adds element to enqueue stack' do
      subject.enqueue(2)
      enqueue_stack = subject.instance_variable_get(:@enqueue_stack)
      expect(enqueue_stack.peak).to eq(2)
    end

    it 'does not add element to dequeue stack' do
      subject.enqueue(2)
      dequeue_stack = subject.instance_variable_get(:@dequeue_stack)
      expect(dequeue_stack.peak).to eq(nil)
    end
  end

  describe '#dequeue' do
    it 'dequeues element' do
      subject.enqueue(1)
      subject.enqueue(2)
      subject.enqueue(3)
      expect(subject.dequeue).to eq(1)
    end

    context 'when dequeue stack is empty' do
      it 'transfer data from enqueue stack' do
        subject.enqueue(1)
        subject.enqueue(2)

        expect(subject).to receive(:fill_dequeue_with_enqueue_data)
        subject.dequeue
      end
    end

    context 'when dequeue stack is not empty' do
      it 'does not transfer data from enqueue stack' do
        subject.enqueue(1)
        subject.enqueue(2)
        subject.dequeue

        expect(subject).not_to receive(:fill_dequeue_with_enqueue_data)
        subject.dequeue
      end
    end
  end

  describe '#tail' do
    before do
      subject.enqueue(1)
      subject.enqueue(2)
    end

    it 'returns next element to be removed' do
      subject.enqueue(3)
      expect(subject.tail).to eq(1)
    end

    context 'when dequeue stack is empty' do
      it 'transfer data from enqueue stack' do
        subject.enqueue(1)
        subject.enqueue(2)

        expect(subject).to receive(:fill_dequeue_with_enqueue_data)
        subject.tail
      end
    end

    context 'when dequeue stack is not empty' do
      it 'does not transfer data from enqueue stack' do
        subject.enqueue(1)
        subject.enqueue(2)
        subject.dequeue

        expect(subject).not_to receive(:fill_dequeue_with_enqueue_data)
        subject.tail
      end
    end
  end
end
