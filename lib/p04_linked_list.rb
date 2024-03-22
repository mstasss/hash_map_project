class Node
  attr_reader :key
  attr_accessor :value, :next, :prev

  def initialize(key = nil, value = nil)
    @key = key
    @value = value
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@value}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @tail.prev = @head
    @head.next = @tail
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    return true if @head.value == nil #&& @tail.value == nil
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    old_tail = @tail
    @tail = Node.new(key,val)
    old_tail.next = @tail
    @tail.prev = old_tail
  end

  def update(key, val)
  end

  def remove(key)
  end

  # def each
  # end

  def print
    # self.each do |node|
    #   p node.value
    # end
    pointer = @head
    until pointer == nil
      p pointer.value
      pointer = pointer.next
    end
    nil
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

test = LinkedList.new

test.append("apple",2)
test.append(4,"hello")

p test.print
