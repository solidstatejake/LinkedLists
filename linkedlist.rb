class LinkedList

  def initialize
    @head = nil
  end

  # push element onto end of list
  def push(value)
    if @head
      tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  # Remove last element
  def pop
    if @head
      node = @head
      node = node.next_node until node == self.find(self.length - 1)
      node.next_node = nil
    else
      puts "Linked list of length HEAD. Cannot destroy self through pop."
    end
  end

  def insert(index, value = nil)
    if @head
      node = find(index - 1)
      remaining_list = find(index)
      node.next_node = Node.new(value, remaining_list)
    end

  end

  # Remove element by index
  # Cannot be used on first element (the head). Instead, use assign()
  def remove(node)
    if @head
      nth_node = self.find(node - 1)
      nth_node.next_node = nth_node.next_node.next_node
    end
  end

  # Return nth element. Equivalent to find()
  def [](index)
    find(index)
  end

  # Assign nth element Equivalent to assign()
  def []=(index, value)
    node = find(index)
    node.value = value
  end

  # Alter value of nth element. Equivalent to []= operator
  def assign(index, value)
    node = find(index)
    node.value = value
  end

  # Return element associated with index. Equivalent to the [] operator
  def find(index)
    # if negative index, compensate to yield correct value
    index = self.length - (-index) if index < 0
    if index > 0
      if index > self.length - 1
        return nil
      else
        count = 1
        node = @head.next_node
        until count == index ##REMOVE REMOVE REMOVE
          node = node.next_node
          count += 1
        end
        node
      end
    elsif index == 0
      return @head
    else
      #WRITE EXCEPTION FOR INCORRECT INPUT
    end
  end

  def head
    @head
  end

  # return the last element
  def tail
    node = @head
    return node unless node.next_node
    return node unless node.next_node while (node = node.next_node)
  end

  # Return number of elements in linked list
  def length
    if @head.nil?
      0
    elsif @head
      node = @head
      count = 1
      until node.next_node.nil?
        node = node.next_node
        count += 1
      end
      return count
    end
  end

  # Equivalent to length
  def size
    length
  end

  # Only useful if one copy of the datum exists in the list
  # Verify a value exists at a certain index
  def index?(value, index)
    count = 0
    node = @head
    loop do
      if count == index && node.value == value
        return true
      elsif node.next_node == nil then return false
      end
      node = node.next_node
      count += 1
    end


  end

  # Display list in pretty fashion
  def display
    count = 1
    node = @head
    self.length.times do |index|
      print "(Node: #{index} | value: #{node.value}) -> "
      print "\n" if count % 4 == 0 && count != 0
      print 'nil' if node.next_node == nil
      node = node.next_node
      count += 1
    end
    nil
  end

end

class Node
  attr_accessor :next_node, :value

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node  = next_node
  end

  def to_s
    "#{@value}"
  end

end

list = LinkedList.new

list.push 1
list.push 2
list.push 3
list.push 4
list.push 5
list.push 6

list.display
