class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0000000 if self == []
    self.map(&:to_s).join().to_i
  end
end

class String
  def hash
    self.chars.map(&:ord).join().to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.each_value.flatten.chars.map(&:ord).join().to_i
    # self.flatten.map(&:to_s).join().to_i

  end
end

# test = Array.newa.fla
