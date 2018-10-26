require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :position
  def initialize(position = [0,0])
    @position = position
    @root_node = PolyTreeNode.new(position)
  end

  def self.root_node
    @root_node
  end
end
