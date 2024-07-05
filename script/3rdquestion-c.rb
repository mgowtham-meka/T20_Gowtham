class Stack
    def initialize(size)
      @size = size
      @store = Array.new(@size)
      @top = -1
    end
    
    def pop
      if empty?
        nil
      else
        popped = @store[@top]
        @store[@top] = nil
        @top = @top.pred
        popped
      end
    end
    
    def push(element)
      if full? or element.nil?
        nil
      else
        @top = @top.succ
        @store[@top] = element
        self
      end
    end
    
    def size
      @size
    end
    
    def peek
      @store[@top]
    end
    
    def each
      (@top + 1).times do |i|
        yield @store[i]
      end
    end
    
    private
    
    def full?
      @top == (@size - 1)
    end
    
    def empty?
      @top == -1
    end
end

  s= Stack.new(10)
  s.push(74)
  s.push(84)
  s.push(96)
  s.push(12)
  s.push(78)
  s.push(15)
  s.push(67)
  s.push(23)
  s.pop()

  s.each do |i|
    puts i
  end
  
  puts "my first element that is present on top of the stack "
  puts s.peek