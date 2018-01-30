# frozen_string_literal: true

module DataStructures
  class Trie
    class Node
      attr_reader :data, :size

      def initialize(data = nil)
        @data = data
        @children = {}
        @final = false
        @size = 0
      end

      def add(data)
        return unless get(data).nil?
        child = Node.new(data)
        @children[data] = child
        child
      end

      def get(data)
        @children[data]
      end

      def set_as_final
        @final = true
      end

      def final?
        @final || @children.empty?
      end

      def increment_size
        @size += 1
      end
    end

    def initialize
      @root = Node.new
    end

    def insert(word)
      return if final_word?(word)
      node = @root
      word.chars.each do |w|
        child = node.get(w)
        node = child.nil? ? node.add(w) : child
        node.increment_size
      end
      node.set_as_final
    end

    def partial_word?(word)
      last_node(word).nil? ? false : true
    end

    def final_word?(word)
      node = last_node(word)
      return false if node.nil?
      node.final?
    end

    def words_length(word)
      node = last_node(word)
      return 0 if node.nil?
      node.size
    end

    private

    def last_node(word)
      node = @root
      word.chars.each do |w|
        child = node.get(w)
        return nil unless child
        node = child
      end
      node
    end
  end
end

# # Answer on HackerRank
# #!/bin/ruby
# trie = DataStructures::Trie.new
# n = gets.strip.to_i
# for a0 in (0..n-1)
#   op, contact = gets.strip.split(' ')

#   case op
#   when 'add'
#     trie.insert(contact)
#   when 'find'
#     puts trie.words_length(contact)
#   end
# end
