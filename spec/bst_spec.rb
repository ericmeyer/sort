require File.expand_path(File.dirname(__FILE__) + '/../lib/bst')

describe BST do
  before(:each) do
    @bst = BST.new
  end
  
  it "starts with no root" do
    @bst.root.should be_nil
  end
  
  describe "#insert" do
    it "inserts one element into the root" do
      @bst.insert(3)
      @bst.root.value.should == 3
    end
    
    it "inserts a second item on the right" do
      @bst.insert(3)
      @bst.insert(4)
      @bst.root.right.value.should == 4
    end

    it "inserts a second item on the left" do
      @bst.insert(3)
      @bst.insert(2)
      @bst.root.left.value.should == 2
    end
    
    it "has inserts recursively" do
      @bst.insert(3)
      @bst.insert(2)
      @bst.insert(1)
      @bst.insert(4)
      @bst.insert(6)
      @bst.insert(5)
      
      @bst.root.left.left.value.should == 1
      @bst.root.right.right.value.should == 6
      @bst.root.right.right.left.value.should == 5
    end
    
    it "does not insert the same number twice" do
      @bst.insert(3)
      @bst.insert(3)
      
      @bst.root.left.should be_nil
      @bst.root.right.should be_nil
    end
  end
  
  describe "#find" do
    it "does not find anything" do
      @bst.find(3).should be_false
    end
    
    it "finds the root value" do
      @bst.insert(3)
      @bst.find(3).should be_true
    end
    
    it "finds the left node" do
      @bst.insert(3)
      @bst.insert(2)
      @bst.find(2).should be_true
    end

    it "finds the right node" do
      @bst.insert(3)
      @bst.insert(4)
      @bst.find(4).should be_true
    end
    
    it "finds recursively left" do
      @bst.insert(3)
      @bst.insert(2)
      @bst.insert(1)
      @bst.find(1).should be_true
    end

    it "finds recursively right" do
      @bst.insert(3)
      @bst.insert(4)
      @bst.insert(5)
      @bst.find(5).should be_true
    end
  end
  
  describe "#delete" do
    context "root node" do
      it "deletes if root is only node" do
        @bst.insert(3)
        @bst.delete(3)
      
        @bst.root.should be_nil
      end
      
      it "handles when only the left child is present" do
        pending
      end
      
      it "handles when only the right child is present" do
        pending
      end

      it "handles when both children are present" do
        pending
      end
    end
    
    context "leaf node (with no children)" do
      it "deletes a right node" do
        @bst.insert(3)
        @bst.insert(4)
      
        @bst.delete(4)
        @bst.root.right.should be_nil
      end

      it "recursively deletes a right node" do
        @bst.insert(3)
        @bst.insert(4)
        @bst.insert(5)
      
        @bst.delete(5)
        @bst.root.right.right.should be_nil
      end

      it "deletes a left node " do
        @bst.insert(3)
        @bst.insert(2)
      
        @bst.delete(2)
        @bst.root.left.should be_nil
      end

      it "recursively deletes a left leaf node" do
        @bst.insert(3)
        @bst.insert(2)
        @bst.insert(1)
      
        @bst.delete(1)
        @bst.root.left.left.should be_nil
      end
    end
    
    context "one child" do
      it "brings the right child up on the right side" do
        @bst.insert(3)
        @bst.insert(4)
        @bst.insert(5)
      
        @bst.delete(4)
        @bst.root.right.value.should == 5
        @bst.root.right.right.should be_nil
      end

      it "brings the left child up on the right side" do
        @bst.insert(3)
        @bst.insert(5)
        @bst.insert(4)
      
        @bst.delete(5)
        @bst.root.right.value.should == 4
        @bst.root.right.left.should be_nil
      end

      it "brings the left child up on the left side" do
        @bst.insert(3)
        @bst.insert(2)
        @bst.insert(1)
      
        @bst.delete(2)
        @bst.root.left.value.should == 1
        @bst.root.left.left.should be_nil
      end
      
      it "brings the left child up on the right side" do
        @bst.insert(3)
        @bst.insert(1)
        @bst.insert(2)
      
        @bst.delete(1)
        @bst.root.left.value.should == 2
        @bst.root.left.left.should be_nil
      end
    end
    
    context "two children" do
      it "becomes the right node" do
        @bst.insert(3)
        @bst.insert(5)
        @bst.insert(4)
        @bst.insert(6)
        
        @bst.delete(5)
        @bst.root.right.value.should == 6
        @bst.root.right.left.value.should == 4
        @bst.root.right.right.should be_nil
      end
      
      it "becomes the right's left node" do
        @bst.insert(3)
        @bst.insert(5)
        @bst.insert(4)
        @bst.insert(7)
        @bst.insert(6)
        
        @bst.delete(5)
        @bst.root.right.value.should == 6
        @bst.root.right.left.value.should == 4
        @bst.root.right.right.value.should == 7
        @bst.root.right.right.left.should be_nil
      end

      it "becomes the right node on the left side" do
        @bst.insert(5)
        @bst.insert(2)
        @bst.insert(1)
        @bst.insert(4)
        
        @bst.delete(2)
        @bst.root.left.value.should == 4
        @bst.root.left.left.value.should == 1
        @bst.root.left.right.should be_nil
      end
      
      it "becomes the right's left node on the left side" do
        @bst.insert(5)
        @bst.insert(2)
        @bst.insert(1)
        @bst.insert(4)
        @bst.insert(3)
        
        @bst.delete(2)
        @bst.root.left.value.should == 3
        @bst.root.left.left.value.should == 1
        @bst.root.left.right.value.should == 4
        @bst.root.left.right.left.should be_nil
      end
    end
  end
end