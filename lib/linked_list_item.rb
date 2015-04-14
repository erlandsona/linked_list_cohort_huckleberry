class LinkedListItem
  #Look into Comparable...
  include Comparable

  attr_reader :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

  def next_item=(payload)
    raise(ArgumentError) if payload === self
    @next_item = payload
  end

  def last?
    next_item.nil?
  end

  def <=>(other)
    self.payload.class == other.payload.class ?
    self.payload <=> other.payload :
    self.payload.class.to_s <=> other.payload.class.to_s

# Option 2..
#  precedence = [Fixnum, String, Symbol]
#  precedence.index(self.payload.class) <=> class_precedence.index(other.payload.class)

  end

  def ===(other)
    self.equal? other
  end

end
