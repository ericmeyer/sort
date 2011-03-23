class BubbleSort
  def initialize(list)
    @list = list
    @swapped = true
  end
  
  def sort
    while @swapped
      @swapped = false
      (@list.size - 1).times do |index|
        compare_elements_at(index, index + 1)
      end
    end
    return @list
  end
  
  private
  
  def compare_elements_at(a, b)
    swap_elements_at(a, b) if @list[a] > @list[b]
  end
  
  def swap_elements_at(a, b)
    @list[a], @list[b] = @list[b], @list[a]
    @swapped = true
  end
end
