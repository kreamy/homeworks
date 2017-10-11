class Queue  # FIFO
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    el
  end

  def dequeue
    [@queue.pop]
  end

  def show
    @queue.dup
  end
end

queue = Queue.new
p queue.enqueue(1)
p queue.enqueue(2)
p queue.enqueue(3)
queue.show
queue.dequeue
p queue.show
queue.dequeue
p queue.show
