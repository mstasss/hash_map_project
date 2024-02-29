class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max,false) #if max == 4, [false,false,false,false]
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true unless @store[num]
    true
  end

  def remove(num)
    if @store[num] == true
      @store[num] = false
    else
      return nil
    end

  end

  def include?(num)
    return true if @store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end


  def insert(num)
    return false if include?(num)
    self[num] << num
    true
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end


  private

  def [](num)
    return @store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    @count += 1
    self.resize! if count == num_buckets
    true
  end

  def remove(num)
    return nil if !self.include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    return false if self[num] == nil
    self[num].include?(num)
  end

  def inspect
    p @store
  end

  # private

  def [](num)
    return @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times {@store << Array.new}
  end


end

test = ResizingIntSet.new

test.inspect
test.resize!
test.inspect