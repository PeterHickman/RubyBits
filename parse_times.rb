class ParseTime
  SECONDS = 1
  MINUTES = 60
  HOURS = 3_600
  DAYS = 86_400
  WEEKS = 604_800

  def self.to_seconds(string)
    x = string.gsub(/(\d+)/, ' \\1 ').strip.downcase.split(/\s+/).select { |s| s != 'and' }

    unless x.size.even?
      fail "There should be an even number of terms '#{x.join(' ')}'"
    end

    seconds = 0
    while x.size > 0
      value = x.shift
      if value =~ /^-?\d+$/
        value = value.to_i
      else
        fail "Expecting a number, got '#{value}'"
      end

      unit  = x.shift

      case unit
      when 's', 'sec', 'second', 'secs', 'seconds'
        seconds += value * SECONDS
      when 'm', 'min', 'mins', 'minute', 'minutes'
        seconds += value * MINUTES
      when 'h', 'hour', 'hours'
        seconds += value * HOURS
      when 'd', 'day', 'days'
        seconds += value * DAYS
      when 'w', 'week', 'weeks'
        seconds += value * WEEKS
      else
        fail "Unknown time unit '#{unit}'"
      end
    end

    seconds
  end
end
