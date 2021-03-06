require_relative 'linked_list_item'

class LinkedList

  attr_reader :size

  def initialize(*values)
    @size = 0
    # Refactor to utilize values.each or some other Enumerable Method...
    values.each do |i|
      push(i)
    end
  end

  def push(item)
    new_item = LinkedListItem.new(item)
    if @first_item.nil?
      @first_item = new_item
    else
      @last_item.next_item = new_item
    end
    @size += 1
    @last_item = new_item
  end

  def get_item(index)
    current_node = @first_item
    index.times do
      raise IndexError if @first_item.nil? or current_node.last?
      current_node = current_node.next_item
    end
    current_node
  end

  def get(index)
    raise IndexError if index < 0
    if index == 0
      @first_item.payload
    else
      get_item(index).payload
    end
  end

  alias [] get

  def []=(index, item)
    if index == 0
      current_node = @first_item
    else
      prev_node = get_item(index - 1)
      current_node = prev_node.next_item
    end

    new_item = LinkedListItem.new(item)
    next_item = current_node.next_item
    new_item.next_item = next_item

    if index == 0
      @first_item = new_item
    else
      prev_node.next_item = new_item
    end
  end

  def delete(index)
    raise IndexError if @first_item.nil?
    if index == 0
      current_node = @first_item
    else
      prev_node = get_item(index - 1)
      current_node = prev_node.next_item
    end

    next_item = current_node.next_item

    if index == 0
      @first_item = next_item
    else
      prev_node.next_item = next_item
    end
    @size -= 1
  end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  def to_s
    str = "| "
    # loop goes here
    current_node = @first_item
    until current_node.nil?
      str << current_node.payload
      punctuation = current_node.last? ? " " : ", "
      str << punctuation
      current_node = current_node.next_item
    end
    str << "|"
    str
  end
end
