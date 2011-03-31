require "bst_node"

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
      delete_root
    else
      @root.delete(value)
    end
  end
  
  private ############################
  
  def delete_root
    case @root.children.size          
    when 0
      @root = nil
    when 1
      @root = @root.children.first
    when 2
      temp = @root.in_order_successor_value
      @root.delete(temp)
      @root.value = temp
    end
  end
end