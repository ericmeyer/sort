require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
require "merge_sort"

describe MergeSort do
  it "returns an already sorted list" do
    MergeSort.new([1, 2]).sort.should == [1, 2]
  end
  
  it "swaps two element" do
    MergeSort.new([2, 1]).sort.should == [1, 2]
  end
  
  it "sorts a complicated example" do
    MergeSort.new([2, 1, 5, 7, 25, 9, 11, 3, 3, 2, 33, 7, 4, 1]).sort.should == [1, 1, 2, 2, 3, 3, 4, 5, 7, 7, 9, 11, 25, 33]
  end
  
  context "#merge" do
    before(:each) do
      @merge_sort = MergeSort.new([])
    end
    
    it "merges two empty arrays" do
      @merge_sort.merge([], []).should == []
    end
    
    it "merges when the first array is empty" do
      @merge_sort.merge([], [1, 2, 3]).should == [1, 2, 3]
    end

    it "merges when the second array is empty" do
      @merge_sort.merge([1, 2, 3], []).should == [1, 2, 3]
    end
    
    it "merges when the second are all before the first" do
      @merge_sort.merge([3, 4], [1, 2]).should == [1, 2, 3, 4]
    end
    
    it "merges two alternating lists" do
      @merge_sort.merge([1, 3, 4, 8, 9], [1, 2, 5, 7, 11]).should == [1, 1, 2, 3, 4, 5, 7, 8, 9, 11]
    end
  end
end