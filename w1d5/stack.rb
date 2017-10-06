class Stack  # LIFO
   def initialize
     @stack = []
   end

   def add(el)
     @stack << el
     el
   end

   def remove
     [@stack.pop]
   end

   def show
     @stack.dup
   end
 end

stack = Stack.new
p stack.add(1)
p stack.add(2)
p stack.add(3)
p stack.remove
p stack.show
p stack.remove
p stack.show
