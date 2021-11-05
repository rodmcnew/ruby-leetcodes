# https://leetcode.com/problems/lru-cache/submissions/

class Node

=begin
    :type capacity: Integer
=end
    attr_accessor :key, :value, :next, :prev
    def initialize(key = nil, value = nil)
        @key = key
        @value = value
    end
end

class LRUCache

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @capacity = capacity
        @head = Node.new()
        @tail = Node.new()
        @head.next = @tail
        @tail.prev = @head
        @map = {}
    end

=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        node = @map[key]
        if node
            moveNodeToTail(node)
            return node.value
        else
            return -1
        end
    end

=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        node = @map[key]
        if node
            @map[key].value = value
            moveNodeToTail(node)
            return node.value
        else
            if @map.size == @capacity
                @map.delete(@head.next.key)
                removeNode(@head.next)
            end
            node = Node.new(key, value)
            addNodeToTail(node)
            @map[key] = node
        end
    end

    def removeNode(node)
        node.prev.next = node.next
        node.next.prev = node.prev
    end
       
    def addNodeToTail(node)
        node.next = @tail
        node.prev = @tail.prev
       
        @tail.prev.next = node
        @tail.prev = node
    end
   
    def moveNodeToTail(node)
        self.removeNode(node)
        self.addNodeToTail(node)
    end

end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
