class MergeSort
  def initialize(list)
    @list = list
  end
  
  def sort
    return sorted(@list)
  end
  
  def merge(first_list, second_list)
    new_list = []
    until first_list.empty? && second_list.empty?
      if first_list.empty?
        new_list << second_list.pop
      elsif second_list.empty?
        new_list << first_list.pop
      elsif second_list.last > first_list.last
        new_list << second_list.pop
      else
        new_list << first_list.pop
      end
    end
    return new_list.reverse
  end
  
  private
  
  def sorted(list)
    return list if list.size <=1
    return merge(sorted(first_half_of(list)), sorted(second_half_of(list)))
  end
  
  def first_half_of(list)
    list[0..((list.size/2.0).floor - 1)]
  end
  
  def second_half_of(list)
    list[(list.size/2.0)..(list.length - 1)]
  end
end