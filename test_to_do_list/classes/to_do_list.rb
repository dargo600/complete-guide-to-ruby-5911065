module LIL
  class ToDoList
    include Enumerable

    def initialize(items=[])
      @items = items
    end

    def each
      @items.each {|item| yield(item) }
    end

    def last
      @items[-1]
    end

    def <<(new_item)
      @items.unshift(new_item)
    end
  end
end
