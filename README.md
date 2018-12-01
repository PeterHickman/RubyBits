# RubyBits

All those useful bits of Ruby code that I use but does not justify a gem of their own

## MiniumAverageMaximum

When parsing log files (like I do, all too often) there is the need to report these values for the data. This class does it

## BidirectionalHash

It might seem like a very strange requirement but this happens quite a bit. Could do with some error checking

## ParseTime

Converts a human expression of time into seconds, there is probably something that does this already

* 1 day => 86_400
* 5 minutes => 300
* 1 day and 5 minutes => 867_00
* 1d1s => 86_401
* 5m1d3s => 86_703
