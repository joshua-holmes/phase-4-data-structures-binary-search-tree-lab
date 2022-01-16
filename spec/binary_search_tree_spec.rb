require "pry"
describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }
  
  describe "#search" do
    it "it returns nil if the tree is empty" do
      expect(tree.search(8)).to eq(nil)
    end

    it "it returns the node with the target value" do
      #      10
      #    /  \
      #   2   50
      #  / \
      # 1  3
      tree.root = Node.new(10)
      tree.root.left = Node.new(2)
      tree.root.right = Node.new(50)
      tree.root.left.left = Node.new(1)
      tree.root.left.right = Node.new(3)
      expect(tree.search(3)).to eq(tree.root.left.right)
    end

    it "it returns nil if target value is not found" do
      #    5
      #  /  \
      # 3   11
      tree.root = Node.new(5)
      tree.root.left = Node.new(3)
      tree.root.right = Node.new(11)
      expect(tree.search(15)).to eq(nil)
    end
  end

  describe "#insert" do
    it "returns the inserted node" do
      node = tree.insert(1)
      
      expect(node).to have_attributes(
        class: Node,
        value: 1
      )
    end

    it "inserts node into the correct position in an empty tree" do
      node = tree.insert(1)
      expect(tree.root).to eq(node)
    end

    it "inserts node into the correct position in an existing tree" do

      #      10
      #    /  \
      #   2   50
      #  / \
      # 1  3
      tree.root = Node.new(10)
      tree.root.left = Node.new(2)
      tree.root.right = Node.new(50)
      tree.root.left.left = Node.new(1)
      tree.root.left.right = Node.new(3)
      
      #      10
      #    /  \
      #   2   50
      #  / \
      # 1  3
      #     \
      #     4
      inserted_node = tree.insert(4)
      expect(tree.root.left.right.right).to eq(inserted_node)
    end

    it "it doesn't insert a duplicate value" do
      node_1 = tree.insert(11)
      node_2 = tree.insert(11)
      expect(tree.root).to eq(node_1)
      expect(tree.root.left).to eq(nil)
      expect(tree.root.right).to eq(nil)
    end
  end
end
