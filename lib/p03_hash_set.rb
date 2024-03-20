class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    #old code
    # return false if self.include?(key)
    self[key] << key
    @count += 1
    self.resize! if count == num_buckets
    # true
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return nil if !self.include?(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # return @store[num % num_buckets]
    if num.is_a?(Array)
      output = 5
    elsif num.is_a?(Hash)
      output = num.values.map(&:ord).sort.join().to_i
    elsif num.is_a?(Array)
      output = num.map(&:ord).join().to_i
    elsif num.is_a?(String)
      output = num.chars.map(&:ord).join().to_i
    elsif num.is_a?(Symbol)
      output = num.to_s.chars.map(&:ord).join().to_i
    else
      output = num
    end
      return @store[output % num_buckets]
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
