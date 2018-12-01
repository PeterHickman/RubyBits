##
# When you add a mask to an ip address such as 1.1.1.1/24 you are
# supposed to set the bits outside the mask to 0 in the dotted quad
# but not all the tools do this. But plenty will complain if you
# don't do it yourself
#
# So this does just that in possibly the least efficient way possible
#
# This 1.1.1.1/24 should become 1.1.1.0/24 and 192.168.3.10/24
# becomes 192.168.3.0/24
##

def normalise(address)
  return address unless address.include?('/')
  return address if address.include?('/32')

  quad, mask = address.split('/')
  mask = mask.to_i

  ##
  # The address as a binary string
  ##
  quad_b = quad.split('.').map(&:to_i).map { |p| sprintf('%08b', p) }.join('')

  ##
  # Show only the address bits inside the mask
  ##
  r = ''
  (0...32).each do |i|
    if i < mask
      r << quad_b[i]
    else
      r << '0'
    end
  end

  n = []
  4.times do
    x = r.slice!(0, 8)
    n << x.to_i(2).to_s
  end
  n = n.join('.')

  "#{n}/#{mask}"
end
