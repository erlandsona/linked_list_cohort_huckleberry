class LinkedListItem
  #Look into Comparable...
  include Comparable

  attr_accessor :payload, :next_item

  def initialize(payload)
    @payload = payload
  end

end
