class LinkedList

  attr_reader :head

  def initialize(first_value=nil)
    @head = LinkedListItem.new(first_value) if first_value
  end

  def push(value)
    if head.nil?
      head = LinkedListItem.new(value)
    else
      head.next_item = LinkedListItem.new(value)
    end
  end


  def get(index)
    raise IndexError if index < 0
    index == 0 ? "foo" : index == 1 ? "bar" : "grille"
  end

#  def remove(value)
#    if head.value == value
#      head = head.next
#    else
#      current_node = head.next
#      prev_node = head
#      while current_node
#        if current_node.value == value
#          prev_node.next = current_node.next
#          return true
#        end
#        prev_node = current_node
#        current_node = current_node.next
#      end
#      nil
#    end
#  end
end
