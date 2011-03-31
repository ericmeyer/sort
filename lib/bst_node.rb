class BSTNode
  attr_accessor :value, :right, :left, :parent
  
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
  
  def delete(value_to_delete)
    if value_to_delete >= self.value
      handle_delete_for_right_child(value_to_delete)
    else
      handle_delete_for_left_child(value_to_delete)
    end
  end

  def find(value)
    return true if self.value == value
    return children.any? { |child| child.find(value) }
  end  
    
  def children
    [@left, @right].compact
  end
    
  def in_order_successor_value
    temp = self.right
    while temp.left
      temp = temp.left
    end
    return temp.value
  end
  
  private #########################
  
  def right_value
    @right.value if @right
  end
  
  def left_value
    @left.value if @left
  end
  
  def handle_delete_for_right_child(value_to_delete)
    if right_value == value_to_delete
      case @right.children.size
      when 0
        @right = nil
      when 1
        @right = @right.children.first
      when 2
        temp = @right.in_order_successor_value
        self.delete(temp)
        @right.value = temp
      end
    else
      @right.delete(value_to_delete)
    end
  end
  
  def handle_delete_for_left_child(value_to_delete)
    if left_value == value_to_delete
      case @left.children.size
      when 0
        @left = nil
      when 1
        @left = @left.children.first
      when 2
        temp = @left.in_order_successor_value
        self.delete(temp)
        @left.value = temp
      end
    else
      @left.delete(value_to_delete)
    end
  end
end