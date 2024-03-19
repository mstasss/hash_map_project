class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    #old code
    return false if self.include?(key.map(&:ord))
    self[key] << key
    @count += 1
    self.resize! if count == num_buckets
    true
  end

  def include?(key)
    return false if self[key] == nil
    self[key].include?(@store[key])
  end

  def remove(key)
    return nil if !self.include?(num)
    self[num].delete(num)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # return @store[num % num_buckets]
    if num.is_a? Hash
      output = self.values.map(&:ord).sort.join().to_i
      return 0 if output == nil
    elsif num.is_a? Array
      return 0000000 if self == []
      output = self.map(&:to_s).join().to_i
    elsif is_a? String #string/int
      output = self.chars.map(&:ord).join().to_i
    else
      output = num
    end
      @store[output % num_buckets]
  end



  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times {@store << Array.new}
    p num_buckets
    (0..(num_buckets/2)).each do |i|
      if !self[i].empty?
        self[i].each do |el|
          self[i].delete(el)
          self[el] << el
        end
      end
    end
  end
end
