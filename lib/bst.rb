class BSTNode
  attr_accessor :value, :right, :left, :parent
  
  # def initialize(parent)
  #   @parent = parent
  # end
  
  def insert(value)
    if self.value.nil?
      self.value = value
    elsif value > self.value
      @right ||= BSTNode.new
      @right.insert(value)
    elsif value < self.value
      @left ||= BSTNode.new
      @left.insert(value)
    end
  end
  
  def delete(value)
    if @right && @right.value == value
      case @right.children.size
      when 0
        @right = nil
      when 1
        @right = @right.children.first
      when 2
        node_to_move = @right.right
        while node_to_move.left
          node_to_move = node_to_move.left
        end
        temp = node_to_move.value
        self.delete(node_to_move.value)
        @right.value = temp
      end
    elsif @left && @left.value == value
      case @left.children.size
      when 0
        @left = nil
      when 1
        @left = @left.children.first
      when 2
        node_to_move = @left.right
        while node_to_move.left
          node_to_move = node_to_move.left
        end
        temp = node_to_move.value
        self.delete(node_to_move.value)
        @left.value = temp
      end
    elsif @right && value > @value
      @right.delete(value)
    elsif @left && value < @value
      @left.delete(value)
    end
  end

  def find(value)
    return true if self.value == value
    return children.any? { |child| child.find(value) }
  end  
    
  def children
    [@left, @right].compact
  end
    
  private #########################
  
  def handle_delete_for_child(child)
  end
end

class BST
  attr_reader :root

  def insert(value)
    @root ||= BSTNode.new
    @root.insert(value)
  end
  
  def find(value)
    return false if @root.nil?
    return @root.find(value)
  end
  
  def delete(value)
    if @root.value == value
      @root = nil
    else
      @root.delete(value)
    end
  end
end