module Enumerable
  # Your code goes here
  def my_each_with_index
    idx = 0
    self.my_each do |val|
      yield(val, idx)
      idx += 1 
    end

    self
  end

  def my_select
    filtered_arr = []

    self.my_each {|val| filtered_arr << val if yield(val) }

    filtered_arr
  end

  def my_all?
    bool = true

    self.my_each  { |val| bool = false unless yield(val) }

    bool
  end

  def my_any?
    bool = false

    self.my_each { |val| bool = true if yield(val) }

    bool
  end

  def my_none?
    bool = true

    self.my_each { |val| bool = false if yield(val) }

    bool
  end

  def my_count
    return self.length unless block_given?

    count = 0
    
    self.my_each { |val| count += 1 if yield(val) }

    count
  end

  def my_map
    transformed_arr = []
    self.my_each { |val| transformed_arr << yield(val) }
    transformed_arr
  end

  def my_inject(initial = 0)
    result = initial
    self.my_each { |val| result = yield(result, val) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    cpt = 0

    while cpt < self.length
      yield self[cpt]
      cpt += 1
    end

    self
  end
end
