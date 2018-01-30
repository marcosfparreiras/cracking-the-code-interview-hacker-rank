# frozen_string_literal: true

module DataStructures
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

  class BracketsAnalyzer
    BRACKETS_MATCHES = {
      ']' => '[',
      ')' => '(',
      '}' => '{'
    }.freeze

    def initialize(string)
      @stack = DataStructures::Stack.new
      @string = string
    end

    def balanced?
      @string.chars.each do |bracket|
        if open_bracket?(bracket)
          @stack.push(bracket)
        elsif close_bracket?(bracket)
          last_open_bracket = @stack.peak
          return false unless last_open_bracket == BRACKETS_MATCHES[bracket]
          @stack.pop
        end
      end
      @stack.empty?
    end

    private

    def open_bracket?(bracket)
      BRACKETS_MATCHES.values.include?(bracket)
    end

    def close_bracket?(bracket)
      BRACKETS_MATCHES.keys.include?(bracket)
    end
  end
end

# # Answer on HackerRank
# #!/bin/ruby

# t = gets.strip.to_i
# for a0 in (0..t-1)
#     expression = gets.strip
#     analyzer = DataStructures::BracketsAnalyzer.new(expression)
#     answer = analyzer.balanced? ? 'YES' : 'NO'
#     puts answer
# end
