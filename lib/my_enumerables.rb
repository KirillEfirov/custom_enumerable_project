module Enumerable
  def my_each
    if block_given?
      #self.each do |i|
      for i in self do
        yield(i)
      end
    end
    self
  end
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

  def my_select
    self if not block_given?
  
    arr = Array.new
    for i in self do
      arr << i if yield(i)
    end
    
    return arr
  end

  def my_all?   
    if block_given?
      truth = 0
      self.my_each { |value| truth += 1 if yield(value) }

      truth == self.length ? true : false
    else
      arr = Array.new

      self.my_each { |value| arr.push(true) if value}

      (arr.length == self.length || self.length == 0) ? true : false
    end
  end

  def my_any?   
    if block_given?
      truth = 0
      self.my_each { |value| truth += 1 if yield(value) }

      truth >= 1 ? true : false
    else
      arr = Array.new

      self.my_each { |value| arr.push(true) if value}

      (arr.length >= 1) ? true : false
    end
  end

  def my_none?   
    if block_given?
      lie = 0
      self.my_each { |value| lie += 1 unless yield(value) }

      lie == self.length ? true : false
    else
      arr = Array.new

      self.my_each { |value| arr.push(false) unless value}

      (arr.length == self.length || self.length == 0) ? true : false
    end
  end

  def my_count(param = "optional")
    counter = 0
    if block_given?
      self.my_each { |value| counter += 1 if yield(value) }

      return counter
    else
        return self.length if param == "optional"

        arr = self.my_select { |value| value == param }
        return arr.length
    end

  end

  def my_map
    return Enumerable unless block_given?

    arr = Array.new

    self.my_each { |value| arr << yield(value) }

    return arr
  end
  
  def my_inject(initial_value = 0)
    if block_given?
      prod = initial_value
      self.my_each_with_index do |value, ind|
          iteration = yield(prod, value)
          prod = iteration
      end
      return prod
    end
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
