# Bidirectional hash? Probably not the correct term but something that
# need every now and then

class BidirectionalHash
  def initialize(h = {})
    @data = {}
    h.each do |k, v|
      self[k] = v
    end
  end

  def []=(k,v)
    @data[k] = v
    @data[v] = k
  end

  def [](k)
    @data[k]
  end
end
