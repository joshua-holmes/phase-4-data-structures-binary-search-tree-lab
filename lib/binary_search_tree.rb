require_relative './node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    node = root
    while node
      return node if node.value == value
      if value < node.value
        node = node.left
      else
        node = node.right
      end
    end
    nil
  end

  def insert(value)
    new_node = Node.new value
    node = root
    # binding.pry
    loop do
      if !node
        return @root = new_node
      elsif value > node.value
        return node.right = new_node unless node.right
        node = node.right
      elsif value < node.value
        return node.left = new_node unless node.left
        node = node.left
      else
        return nil
      end
    end
  end

end 
