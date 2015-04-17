require_relative 'linked_list_item'

class LinkedList

  attr_reader :size

  def initialize(*values)
    @size = 0

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
    new_item = LinkedListItem.new(item)
    if @first_item.nil?
      @first_item =  new_item
    else
      @last_item.next_item = new_item
    end
    @size += 1
    @last_item = new_item
  end

  def get(index)
    raise IndexError if index < 0 or @first_item.nil?
    if index == 0
      @first_item.payload
    else
      current_node = @first_item
      index.times do
        raise IndexError if current_node.last?
        current_node = current_node.next_item
      end
      current_node.payload
    end
  end

  def [](index)
    get(index)
  end

  def []=(index, item)
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
      current_node.payload=(item)
    end
  end

# Naive Implementation of Size...
#  def size
#    if @first_item.nil?
#      return 0
#    else
#      current_node = @first_item
#      count = 0
#      until current_node.nil?
#        current_node = current_node.next_item
#        count += 1
#      end
#      count
#    end
#  end

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

  def delete(index)
    raise IndexError if @first_item.nil?

    current_node = @first_item.next_item
    prev_node = @first_item
    while current_node
      if index == 0
        @first_item = current_node
        return true
      elsif current_node.payload == get(index)
        prev_node.next_item = current_node.next_item
        return true
      end
      prev_node = current_node
      current_node = current_node.next_item
    end
    nil
  end
end
