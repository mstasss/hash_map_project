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
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.prev = nil
    self.next = nil
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](index)
    each_with_index { |node, i| return node if i == index }
    nil
  end

  def first
    @head.next == @tail ? nil : @head.next
  end

  def last
    @tail.prev == @head ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.value if node.key == key }
    nil
  end

  def include?(key)
    any? { |node| node.key == key }
  end

  def append(key, value)
    new_node = Node.new(key, value)
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, value)
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
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.value}]" }.join(", ")
  end
end
