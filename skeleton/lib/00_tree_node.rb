class PolyTreeNode
  def initialize(value, children = [])
    @value = value
    @children = children
    @parent = nil
  end

  def parent
    @parent 
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    node.push(self)
    @parent = node
  end

end
