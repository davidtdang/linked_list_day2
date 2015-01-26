class Node
  attr_accessor :value, :next_node, :prev_node
  def initialize(value)
    @value = value
  end
end

class DoublyLinkedList
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)    ### changed from singly   #### from SINGLY TO DOUBLY linked lists, don't need change if just traversing, only change when requires adding/removing nodes
    new_node = Node.new(value)
    @tail.next_node = new_node
    new_node.prev_node = @tail
    @tail = @tail.next_node
  end

  def to_s(current_node=@head)     ### unchanged from singly
    return current_node.value if current_node.next_node.nil?
    return "#{current_node.value} > #{to_s(current_node.next_node)}"
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head.prev_node = new_node
    @head = new_node
  end



end

list = DoublyLinkedList.new(1)
list.append(2)
p list.to_s
list.prepend(9)
p list.to_s
