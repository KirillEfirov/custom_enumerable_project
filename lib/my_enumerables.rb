module Enumerable
  # Your code goes here
  def my_each_with_index
    ind = 0
    if block_given?
      for i in self do
        yield(i, ind)
        ind += 1
      end
    end
    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      #self.each do |i|
      for i in self do
        yield(i)
      end
    end
    self
  end

end
