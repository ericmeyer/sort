require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
require "bubble_sort"

describe BubbleSort do
  it "returns a sorted list" do
    BubbleSort.new([1, 2]).sort.should == [1, 2]
  end
  
  it "swaps two elements" do
    BubbleSort.new([2, 1]).sort.should == [1, 2]
  end
  
  it "sorts a complicated example" do
    BubbleSort.new([5, 1, 4, 2, 8]).sort.should == [1, 2, 4, 5, 8]
  end
end