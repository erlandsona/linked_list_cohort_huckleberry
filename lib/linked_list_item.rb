class LinkedListItem
  #Look into Comparable...
  include Comparable

  attr_accessor :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

  def next_item=(payload)
    payload == self ?
      raise(ArgumentError) :
      @next_item = payload
  end

  def last?
    !@next_item
  end

  def <=>(anOther)
    payload.size <=> anOther.payload.size
  end

  def inspect
    @payload
  end

end
