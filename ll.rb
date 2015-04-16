#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
#
# <YOUR CODE GOES HERE>



# Then, print it out
#
# <YOUR CODE GOES HERE>
if payloads.length == 0
  print "* -> nil"
else
  string = "* -> "
  payloads.each{|x| string << "\"#{x}\" -> "}
  string << "nil"
  print string
end
