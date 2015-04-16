require_relative 'linked_list_item'

class LinkedList

  def initialize(*values)
    @first_item = LinkedListItem.new(values.first) if values.first

    unless @first_item.nil?
      iterater = 1
      while iterater < values.length
        current_node = @first_item
        current_node = current_node.next_item until current_node.last?
        current_node.next_item = LinkedListItem.new(values[iterater])
        iterater += 1
      end
    end
  end

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
    else
      current_node = @first_item
      current_node = current_node.next_item until current_node.last?
      current_node.next_item = LinkedListItem.new(item)
    end
  end

#  def []=(index, value)
#    raise IndexError if index < 0 or @first_item.nil?
#    if index == 0
#      @first_item.payload = value
#    else
#      count = 0
#      current_node = @first_item
#      while count < index
#        raise IndexError if current_node.last?
#        current_node = current_node.next_item
#        count += 1
#      end
#      current_node.payload = value
#    end
#  end

  def get(index)
    raise IndexError if index < 0 or @first_item.nil?
    if index == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < index
        raise IndexError if current_node.last?
        current_node = current_node.next_item
        count += 1
      end
      current_node.payload
    end
  end

  def [](index)
    raise IndexError if index < 0 or @first_item.nil?
    if index == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < index
        raise IndexError if current_node.last?
        current_node = current_node.next_item
        count += 1
      end
      current_node.payload
    end
  end


  def size
    if @first_item.nil?
      return 0
    else
      current_node = @first_item
      count = 1
      current_node = current_node.next_item and
      count += 1 until current_node.last?
      count
    end
  end

  def last
    if @first_item.nil?
      return nil
    else
      current_node = @first_item
      current_node = current_node.next_item until current_node.last?
      return current_node.payload
    end
  end

  def to_s
    string = "| "
    if @first_item.nil?
      return string += "|"
    else
      current_node = @first_item
      string += "#{current_node.payload}"

      current_node = current_node.next_item and
      string += ", #{current_node.payload}" until current_node.last?
      return string += " |"
    end
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
