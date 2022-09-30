require_relative "00_tree_node.rb"
require "byebug"

class KnightPathFinder
    attr_reader :root_node

    def self.valid_moves(pos)
        moves = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2,-1]]
        result = []
        moves.each do |move|
            new_row = pos[0] + move[0]
            new_col = pos[1] + move[1]
            if (0..7).include?(new_row) && (0..7).include?(new_col)
                result << [new_row, new_col]
            end
        end
        result
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        # new_move_positions(pos)
        self.build_move_tree
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        moves.select! { |move| !@considered_positions.include?(move) }
        @considered_positions.concat(moves)
        moves
    end

    def build_move_tree
        queue = [@root_node]
        # debugger
        until queue.empty?
            cur_node = queue.shift
            new_positions = self.new_move_positions(cur_node.value)
            if new_positions.length > 0 
                new_positions.map! do |new_position|
                    new_node = PolyTreeNode.new(new_position)
                    new_node.parent = cur_node
                    new_node
                end
                queue.concat(new_positions)
            end
        end
        @root_node
    end

    def find_path(end_pos)
        @root_node.bfs(end_pos)
    end
end
#hello world