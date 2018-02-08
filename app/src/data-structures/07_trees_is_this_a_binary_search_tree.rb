# frozen_string_literal: true

module DataStructures
  class GenericNode
    attr_accessor :data, :left, :right
    def initialize(data)
      @data = data
      @left = nil
      @right = nil
    end

    def to_a
      arr = []
      arr << @left.to_a unless @left.nil?
      arr << @data
      arr << @right.to_a unless @right.nil?
      arr.flatten
    end
  end

  module BinaryTree
    class Node < DataStructures::GenericNode
      def insert(value)
        if value <= @data
          @left.nil? ? @left = Node.new(value) : @left.insert(value)
        else
          @right.nil? ? @right = Node.new(value) : @right.insert(value)
        end
      end

      def contains?(value)
        return true if value == @data
        if value < @data
          @left.nil? ? false : @left.contains?(value)
        else
          @right.nil? ? false : @right.contains?(value)
        end
      end
    end
  end

  module BstChecker
    MIN_VALUE = -1
    MAX_VALUE = 10_001

    def self.bst?(root)
      recursive_check(root, MIN_VALUE, MAX_VALUE)
    end

    def self.recursive_check(parent, min, max)
      return true if parent.nil?
      return false if min >= parent.data || max <= parent.data
      recursive_check(parent.left, min, parent.data) &&
        recursive_check(parent.right, parent.data, max)
    end
  end
end

# Answer on HackerRank
# As Ruby wasn't an option for this challenge, the language used was Java 7
# The Node class is defined as follows:
#     class Node {
#         int data;
#         Node left;
#         Node right;
#      }
# */
#
# boolean checkBST(Node root) {
#   int minValue = -1;
#   int maxValue = 10001;
#   return recursiveCheck(root, minValue, maxValue);
# }

# boolean recursiveCheck(Node parent, int min, int max) {
#   if(parent == null) return true;
#   if(min >= parent.data || max <= parent.data) {
#     return false;
#   }
#   return recursiveCheck(parent.left, min, parent.data) &&
#     recursiveCheck(parent.right, parent.data, max);
# }
