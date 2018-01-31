# frozen_string_literal: true

module DataStructures
  class Queue
    class Stack
      class Node
        attr_accessor :data, :next
        def initialize(data)
          @data = data
          @next = nil
        end
      end

      def initialize
        @top = nil
      end

      def empty?
        @top.nil?
      end

      def peak
        @top.nil? ? nil : @top.data
      end

      def push(data)
        node = Node.new(data)
        node.next = @top unless empty?
        @top = node
      end

      def pop
        return if empty?
        data = @top.data
        @top = @top.next
        data
      end

      def print
        datas = []
        node = @top
        until node.nil?
          datas << node.data
          node = node.next
        end
        datas.reverse.join(' ')
      end
    end

    def initialize
      @enqueue_stack = Stack.new
      @dequeue_stack = Stack.new
    end

    def enqueue(data)
      @enqueue_stack.push(data)
    end

    def dequeue
      prepare_dequeue_stack
      @dequeue_stack.pop
    end

    def tail
      prepare_dequeue_stack
      @dequeue_stack.peak
    end

    private

    def prepare_dequeue_stack
      return unless @dequeue_stack.empty?
      fill_dequeue_with_enqueue_data
    end

    def fill_dequeue_with_enqueue_data
      @dequeue_stack.push(@enqueue_stack.pop) until @enqueue_stack.empty?
    end
  end
end

# # Answer on HackerRank
# queue = DataStructures::Queue.new
# t = gets.strip.to_i
# t.times do
#   operation, parameter = gets.strip.split(' ')
#   case operation
#   when '1'
#     queue.enqueue(parameter)
#   when '2'
#     queue.dequeue
#   when '3'
#     puts queue.tail
#   end
# end
