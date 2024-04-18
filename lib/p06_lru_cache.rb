require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc

  end

  def count
    @map.count
  end

  def get(key)
    #should not call the proc for cached inputs (FAILED - 1)
    self.update_node!(@store.last[key])
    # # self.update_node!(@map.)
    puts @map.include?(key)

    calc!(key)
    # end

    #lookup key in @map
    #true,false?
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    #this will call the proc
    # if !@map.include?(key)
      @prc.call(key)
    # end
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    if @store.length == max
      eject!
    end
    @store.append(node.key,node.value)
      # puts "node key value"
      # p node.key
      # p node.value
  end

  def eject!
    # Finally, you have to check if the cache has exceeded its max size.
    #If so, call theeject! function, which should delete the least recently
    #used item so your LRU cache is back to max size.
    # Hint: to delete that item, you have to delete the first item in your
    # linked list, and delete that key from your hash. Implemented correctly,
    # # these should both happen in O(1) time.
    # if @store.length == max
      #delete first item in linked list
      @store.remove(@store.first) #delete first item on linked list
      @map.delete(@map[key]) #delete key/node location
    # end
  end
end
