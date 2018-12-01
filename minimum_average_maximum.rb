class MiniumAverageMaximum
  attr_reader :min, :max, :sum, :count

  def initialize
    @min = nil
    @max = nil
    @sum = nil
    @count = nil
  end

  def add(value)
    if @count == nil
      @min = value
      @max = value
      @sum = value
      @count = 1
    else
      if value > @max
        @max = value
      elsif value < @min
        @min = value
      end

      @sum += value
      @count += 1
    end
  end

  def average
    raise RuntimeError.new("No data has been entered to take the average of") if @count == nil

    @sum / @count
  end
end
