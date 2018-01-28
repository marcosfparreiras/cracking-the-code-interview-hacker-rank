# frozen_string_literal: true

module DataStructures
  class LikedList
    attr_reader :head
    Node = Struct.new(:data, :next)

    def initialize
      @head = nil
    end

    def append(data)
      new_node = Node.new(data)
      if empty?
        @head = new_node
        return
      end
      last.next = new_node
    end

    def find_by_value(data)
      return nil if empty?
      current = head
      current = current.next until current.data == data
      current
    end

    def last
      return unless head
      current = head
      current = current.next until current.next.nil?
      current
    end

    def empty?
      head.nil?
    end

    def cycle?
      return false if empty?
      slow = head
      fast = head.next
      until slow.nil? || fast.nil?
        return true if slow == fast
        slow = slow.next
        fast = fast.next.next
      end
      false
    end
  end
end

# Answer on HackerRank
# As Ruby wasn't an option for this challenge, the language used was Java 7
# boolean hasCycle(Node head) {
#     if(head == null) return false;
#     Node slow = head;
#     Node fast = head.next;
#     while(slow.next != null && fast.next != null) {
#       if(slow == fast) return true;
#       slow = slow.next;
#       fast = fast.next.next;
#     }
#     return false;
# }
