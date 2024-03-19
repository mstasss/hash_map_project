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
    result = self.values.map(&:ord).sort.join().to_i
    return 0 if result == nil
    result

    # self.flatten.map(&:to_s).join().to_i
    #b = {a: "z", b: "1"}
    #["z", "1"]
    #take each value from hash in array form ["z","1"]
    #> use ord to get a numeric value
    #> "24".to_i
  end
end

# test = Array.newa.fla
