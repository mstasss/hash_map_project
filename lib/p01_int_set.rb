class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max,false) #if max == 4, [false,false,false,false]
  end

  def insert(num)
    raise "error" if !is_valid?(num)
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
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
