class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        # self.parent = node
        if node != nil
            # self.parent = node
            node.children << self 
        else
            node.parent = nil
        end
        # self
    end




    # def parent
    #     @parent
    # end

    # def children
    #     @children
    # end


end