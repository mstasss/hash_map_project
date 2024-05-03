class StaticArray

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

  attr_accessor :count, :store, :start_idx

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @start_idx = 0
  end

  def [](i)
    return nil if i >= count || i < -count
    i += count if i < 0
    @store[(start_idx + i) % capacity]
  end

  def []=(i, val)
    if i >= count
      (i - count).times { push(nil) }
    elsif i < 0
      return nil if i < -count
      i += count
    end

    if i == count
      resize! if count == capacity
      @count += 1
    end

    @store[(start_idx + i) % capacity] = val
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
    resize! if count == capacity
    @store[(start_idx + count) % capacity] = val
    @count += 1
  end

  def unshift(val)
    resize! if count == capacity
    @start_idx = (start_idx - 1) % capacity
    @store[start_idx] = val
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
    return nil if count == 0
    first_item = @store[start_idx]
    @store[start_idx] = nil
    @start_idx = (start_idx + 1) % capacity
    @count -= 1
    first_item
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
    return false unless other.is_a?(DynamicArray) || other.is_a?(Array)
    return false if count != other.count
    each_with_index { |el, i| return false unless el == other[i] }
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private


  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    each_with_index { |el, i| new_store[i] = el }
    @store = new_store
    @start_idx = 0
  end
end

