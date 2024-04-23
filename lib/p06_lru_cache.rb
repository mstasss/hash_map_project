require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache

  attr_accessor :map, :store, :max, :prc

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
    node = map[key] #if true, it means the map has the key in it
    if node
      update_node!(node)
      node.val
    else
      calc!(key)
    end

  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
      val = self.prc.call(key)
      new_node = @store.append(key,val)
      @map[key] = new_node
      eject! if count > self.max
      val
  end

  def update_node!(node)
    return unless node

    node.remove
    new_node = @store.append(node.key,node.val)
    @map[node.key] = new_node
  end

  def eject!
      old_node = store.first
      old_node.remove
      map.delete(old_node.key)
  end


end

prc = Proc.new {|x| x**2 }
test = LRUCache.new(4,prc)
