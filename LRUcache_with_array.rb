class LRUCache
    def initialize(size)
        @size = size
        @chache = []
    end

    def count
      @cache.count
    end

    def add(el)
        if cache.include?(el)
            @cache.delete(el)
            @cache << el
        elseif count >= size
            @cache.shift
            @cache << el
        else
            @cache << el
        end
    end

    def show
      p @cache
    end

    private
    

  end