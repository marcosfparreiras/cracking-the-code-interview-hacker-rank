# frozen_string_literal: true

require_relative '../../src/data-structures/09_tries_contacts'

describe DataStructures::Trie::Node do
  subject { described_class.new('a') }

  describe '#initialize' do
    it 'initializes with data' do
      expect(subject.data).to eq('a')
    end
  end

  describe '#add' do
    context 'when data child is new' do
      it 'adds a new child node with data' do
        expect { subject.add('b') }.to change {
          subject.instance_variable_get(:@children).size
        }.from(0).to(1)
      end

      it 'child has the defined data' do
        new_node = subject.add('b')
        expect(new_node.data).to eq('b')
      end
    end

    context 'when already has data child' do
      it 'does not add it again' do
        subject.add('b')
        expect { subject.add('b') }.not_to(change do
          subject.instance_variable_get(:@children).size
        end)
      end
    end
  end

  describe '#get' do
    context 'when has child' do
      it 'returns node with data value' do
        new_node = subject.add('b')
        expect(subject.get('b')).to eq(new_node)
      end
    end

    context 'when does not have child' do
      it 'returns nil' do
        expect(subject.get('b')).to eq(nil)
      end
    end
  end
end

describe DataStructures::Trie do
  subject { described_class.new }

  it 'works' do
    expect(true).to eq(true)
  end

  describe '#insert' do
    let(:word) { 'test' }

    it 'create node for each character' do
      root = subject.instance_variable_get(:@root)
      subject.insert(word)
      node_t = root.get('t')
      node_e = node_t.get('e')
      node_s = node_e.get('s')
      node_t2 = node_s.get('t')

      expect(node_t2.data).to eq('t')
    end

    it 'sets last character as a final node' do
      root = subject.instance_variable_get(:@root)
      subject.insert(word)
      node_t = root.get('t')
      node_e = node_t.get('e')
      node_s = node_e.get('s')
      node_t2 = node_s.get('t')

      expect(node_t2.final?).to eq(true)
    end
  end

  describe '#partial_word?' do
    context 'when is partial word' do
      it 'returns true' do
        subject.insert('testing')
        expect(subject.partial_word?('test')).to eq(true)
      end
    end

    context 'when is not partial word' do
      it 'returns false' do
        subject.insert('testing')
        expect(subject.partial_word?('tesp')).to eq(false)
      end
    end
  end

  describe '#final_word?' do
    context 'when is final word' do
      it 'returns true' do
        subject.insert('test')
        subject.insert('task')
        subject.insert('testing')
        expect(subject.final_word?('test')).to eq(true)
      end
    end

    context 'when is not final word' do
      it 'returns false' do
        subject.insert('task')
        subject.insert('testing')
        expect(subject.final_word?('test')).to eq(false)
      end
    end
  end

  describe '#words_length' do
    context 'when is not indexed' do
      it 'returns 0' do
        subject.insert('test')
        expect(subject.words_length('other')).to eq(0)
      end
    end

    context 'when is indexed' do
      it 'returns how many final words it has as children' do
        subject.insert('test')
        subject.insert('tested')
        subject.insert('testing')
        subject.insert('tasks')
        subject.insert('someother')
        expect(subject.words_length('test')).to eq(3)
      end
    end

    context 'samples' do
      before do
        subject.insert('hack')
        subject.insert('hackerrank')
      end

      context 'sample input 1' do
        it 'returns sample output 1' do
          expect(subject.words_length('hac')).to eq(2)
        end
      end

      context 'sample input 2' do
        it 'returns sample output 2' do
          expect(subject.words_length('hak')).to eq(0)
        end
      end
    end
  end
end
