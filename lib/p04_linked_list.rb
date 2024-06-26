class Node
  include Enumerable

  attr_accessor :val, :next, :prev, :key

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
    self.prev = nil
    self.next = nil
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

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
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.each do |node|
      if node.key == key
        return true
      end
    end
    false
  end

  def append(key, val)

    new_node = Node.new(key, val)

    @tail.prev.next = new_node #new node before tail is the new node

    new_node.prev = @tail.prev
    new_node.next = @tail

    @tail.prev = new_node


  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end

  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return nil
      end
    end
  end

  def each
    # if ___.empty?
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end