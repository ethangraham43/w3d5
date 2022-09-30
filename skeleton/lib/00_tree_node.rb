class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node != nil
            @parent.children.delete(self) if @parent != nil
            @parent = node
            node.children << self
        else
            @parent = nil
        end
        # self
    end

    def add_child(node)
        if node != nil && @children.none? { |child| child.value == node.value }
            node.parent = self
        end
    end

    def remove_child(node)
        if @children.any? { |child| child.value == node.value }
            node.parent = nil
            @children.delete(node)
        else
            raise "No such child"
        end
    end

    # def parent
    #     @parent
    # end

    # def children
    #     @children
    # end

    def dfs(value)
        # return node if self == nil
        return self if self.value == value
        self.children.each do |child|
            result = child.dfs(value) 
            if result != nil
                return result
            end
        end
        return nil
    end

    def bfs(value)
        queue = [self]
        until queue.empty?
            cur_node = queue.shift
            if cur_node.value == value
                return cur_node
            else
                queue.concat(cur_node.children)
            end
        end
        return nil
    end
end

