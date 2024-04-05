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
    @store[bucket(key)].include?(key)
  end


  def set(key, val)
    if self.include?(key)
      @store[bucket(key)].update(key,val)
    else
      @store[bucket(key)].append(key,val)
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def get(key)
    @store[bucket(key)].each do |node|
      if node.key == key
        return node.val
      end
    end
  end

  def delete(key)
    num_bucket = @store[bucket(key)]
    num_bucket.remove(key)
    @count -= 1
  end

  def each
    @store.each do |ele|
      # yield ele
      ele.each do |node|
        yield(node.key,node.val)
      end
    end
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

  # private

  def num_buckets
    @store.length
  end

#   def resize!
#     num_buckets.times {@store << Array.new}
#     p num_buckets
#     (0..(num_buckets/2)).each do |i|
#       if !self[i].empty?
#         self[i].each do |el|
#           self[i].delete(el)
#           self[el] << el
#         end
#       end
#     end
#   end
# end

  def resize!
    num_buckets.times {@store << LinkedList.new}
    (0..num_buckets/2).each do |index|
      @store[index].each do |node|
        if node
          self.set(node.key,node.val)
          node.remove
        end
      end
    end
  end

  def bucket(key)
    key.hash % num_buckets # could refactor to return bucket instead of index
  end


end

#proof that include is working
# hash = HashMap.new
# hash.set(:first, 1)
# hash.set(:first, "apple")
# p hash.include?(:asdasd)


hash = HashMap.new
hash.set(:first, 1)
hash.set(:first, "apple")
p hash.delete(:first)

