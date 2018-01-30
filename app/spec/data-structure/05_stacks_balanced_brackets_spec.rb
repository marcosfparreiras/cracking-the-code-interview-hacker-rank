# frozen_string_literal: true

require_relative '../../src/data-structures/05_stacks_balanced_brackets'

describe DataStructures::Stack::Node do
  it 'works' do
    expect(true).to eq(true)
  end
end

describe DataStructures::Stack do
  subject { described_class.new }

  it 'works' do
    expect(true).to eq(true)
  end

  describe '#empty?' do
    it 'returns true when empty' do
      expect(subject.empty?).to eq(true)
    end

    it 'returns false when not empty' do
      node = DataStructures::Stack::Node.new(1)
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

describe DataStructures::BracketsAnalyzer do
  describe '#balanced' do
    context 'when it is full balanced' do
      let(:string) { '[([{}])]' }
      subject { described_class.new(string) }

      it 'returns true' do
        expect(subject.balanced?).to eq(true)
      end
    end

    context 'when it is balanced by parts' do
      let(:string) { '[([{}])]()[{}]({})' }
      subject { described_class.new(string) }

      it 'returns true' do
        expect(subject.balanced?).to eq(true)
      end
    end

    context 'when it is not balanced' do
      context 'when error is on closing wrong bracket' do
        let(:string) { '[([{)}])]' }
        subject { described_class.new(string) }

        it 'returns true' do
          expect(subject.balanced?).to eq(false)
        end
      end

      context 'when error is on not closing final brackets' do
        let(:string) { '[([{}])]{' }
        subject { described_class.new(string) }

        it 'returns true' do
          expect(subject.balanced?).to eq(false)
        end
      end
    end
  end
end
