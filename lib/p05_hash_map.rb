require_relative 'p04_linked_list'
require_relative 'p03_hash_set'
require_relative 'p02_hashing'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].each do |node|
      return true if node.key == key
    end
    false
  end

  def set(key, val)
    if self.include?(key)
      @store[bucket(key)].update(key,val)
    else
      @store[bucket(key)].append(key,val)
    end
  end

  def get(key)
    @store[bucket(key)].each do |node|
      if node.key == key
        return node.val
      end
    end
  end

  def delete(key)
    bucket_num = bucket(key)
    num_bucket.remove(key)
    count -= 1
  end

  # def each
  #   # i = 0
  #   #  while i <= num_buckets
  #   #   self[i]
  #   #   i+= 1
  #   #  end
  # end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  #might need to uncomment these shortly
  alias_method :[], :get
  alias_method :[]=, :set


  def pretty
    self.each do |node|
      puts node
    end
  end

  # private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    key.hash % num_buckets # returns a number
  end


end

hash = HashMap.new
hash.set(:first, 1)
hash.set(:first, "apple")
p hash[:first]


# p test
# lalala