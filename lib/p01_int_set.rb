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
    return false if @store.include?(num)
    @store[num] << num
    @store
    # #   @store[num][0] = true unless @store[num][0]
    # # end

    # raise "error" if num > @store.length

    # # if !@store.include?(num) && num <= @store.length
    #    @store[num] << num #unless @store[num][0]
    #    p @store
    # # end
    # true
  end

  def remove(num)

    @store[num].delete(num)
    # if @store[num][0] == true
    #   @store[num][0] = false
    # else
    #   return nil
  end

  def include?(num)
    return true if @store[num].include?(num)
    false
    # @store.each do |subarray| #[[],[],[this one]]
    #   subarray[num]=false
    # end

    # @store[num][0] == true
  end


  private

  def [](num)
    return @store[num % 20]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

test = IntSet.new
# p test.store
p test.insert(0)
p test.insert(5)
p test.insert(19)
p test.include?(5)
test.remove(5)
p test

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
