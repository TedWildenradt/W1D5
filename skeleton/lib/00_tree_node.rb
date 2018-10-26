require "byebug"
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

  def push(node)
    @children << node
  end

  def pop
    @children.pop
  end

  def inspect
     "value: #{self.value} children: #{self.children} parent: #{self.parent}"
  end

  def parent=(node)
    if node == nil
      @parent = node
      node.children.push(self) unless node == nil
    end
    if @parent == nil
      #debugger
      @parent = node
      node.children.push(self) unless node == nil
    else
      if !node.children.include?(self)
        temp = @parent
        @parent = node
        node.children.push(self)
        temp.children.delete(self)
      end
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
    raise "Not a child of this node" if !self.children.include?(child_node)
  end

  def dfs(target_value)
    return nil if self == nil
    if self.value == target_value
      return self
    end
    stack = self.children
    stack.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
    # stack = [self]
    # until stack.empty?
    #   el = stack.pop
    #
    #   if el.value == target_value
    #     return el
    #   end
    #   el.children.each do |child|
    #     stack.push(child)
    #   end
    # end
    # nil
      # if @value == target_value
      #   return self
      # end
  end

  def bfs(target_value)

    queue = [self]
    until queue.empty?
      el = queue.shift
      if el.value == target_value
        return el
      end
      el.children.each do |child|
        queue.push(child)
      end

    end
    nil

  end
end
