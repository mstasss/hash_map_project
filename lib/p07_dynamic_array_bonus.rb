class StaticArray
  include Enumerable

  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable 

  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i]
  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each do |i|
      if i == val
        return true
      end
    end
    false
  end

  def push(val)
    resize! if @count == self.capacity

    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    resize! if @count == self.capacity
    
    @count += 1
  end

  def pop
    self.each do |i|
      if self[i] == nil 
        val = @store[i - 1]
        @store[i - 1] = nil
        @count -= 1
        return val
      end
    end
    nil
  end

  def shift
    self.each do |i|
      if self[i] != nil
        val = @store[i]
        @store[i] = nil
        @count -= 1
        return val
      end
    end
    nil
  end

  def first
    self[0]
  end

  def last
    self.each do |i|
      if i == nil
        return self[i-1]
      end
    end
  end

  def each
    self.count.times do |i| 
      yield self[i]
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private
  
  
  def resize!
      new_arr = StaticArray.New(self.capacity * 2)
      @store.each_with_index do |val,ind|
        new_arr[ind] = val
      end
      @store = new_arr
  end
end
