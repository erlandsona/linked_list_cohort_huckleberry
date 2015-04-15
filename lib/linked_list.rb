require_relative 'linked_list_item'

class LinkedList

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(item)
      @last_item = @last_item.next_item
    end
  end

  def get(nth_item)
    raise IndexError if nth_item < 0 or @first_item.nil?
    if nth_item == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < nth_item
        raise IndexError if current_node.last?
        current_node = current_node.next_item
        count += 1
      end
      current_node.payload
    end
  end


  def size
   0 if @first_item.last?
  end

#  attr_reader :head
#
#  def initialize(first_value=nil)
#    @head = LinkedListItem.new(first_value) if first_value
#  end
#
#  def push(value)
#    if head.nil?
#      head = LinkedListItem.new(value)
#    else
#      current_node = @head
#      while current_node.next_item
#        current_node = current_node.next_item
#      end
#      current_node.next_item = LinkedListItem.new(value)
#    end
#  end
#
#
#  def get(index)
#    count = 0
#    current_node = @head
#    while count <= index
#      if count == index
#        return current_node
#      else
#        current_node = current_node.next_item
#      end
#      count++
#    end
#  end
#
#
# def get(index)
#    current_index = 0
#    current_node = @head
#    if current_node.nil?
#      current_node = current_node.next_item
#    end
#    while current_index < index
#      return current_node
#      current_index++
#      current_node = current_node.next_item
#    end
#
#    index == 0 ? current_node : "bar"
#  end

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
