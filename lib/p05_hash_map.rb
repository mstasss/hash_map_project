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
  end

  def set(key, val)
    new_bucket = key.hash % num_buckets
    @store[new_bucket].append(key,val)
  end

  def get(key)
  end

  def delete(key)
    bucket_num = bucket(key)
    num_bucket.remove(key)
    count -= 1
  end

  def each
  end

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

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    key.hash % count # returns a number
  end


end

test = HashMap.new
test.set("apple","100")
p test.to_s
# p test