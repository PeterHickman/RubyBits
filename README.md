# RubyBits

All those useful bits of Ruby code that I use but does not justify a gem of their own

## MiniumAverageMaximum

When parsing log files (like I do, all too often) there is the need to report these values for the data. This class does it

## BidirectionalHash

It might seem like a very strange requirement but this happens quite a bit. Could do with some error checking

## ParseTime

Converts a human expression of time into seconds, there is probably something that does this already but there you go. Understands:

* s, sec, second, secs, seconds
* m, min, mins, minute, minutes
* h, hour, hours
* d, day, days
* w, week, weeks

Doesn't go beyond weeks because how many days are there in a month anyhow? It assumes that the leap second is probably not going to be an issue for you. Some examples:

* 1 day => 86_400
* 5 minutes => 300
* 1 day and 5 minutes => 86_700
* 1d1s => 86_401
* 5m1d3s => 86_703

## Normalise netmask

When you add a mask to an ip address such as 1.1.1.1/24 you are supposed to set the bits outside the mask to 0 in the dotted quad but not all the tools do this. But plenty will complain if you don't do it yourself

So this does just that in possibly the least efficient way possible

This 1.1.1.1/24 should become 1.1.1.0/24 and 192.168.3.10/24 becomes 192.168.3.0/24

## Config file

Parse a YAML config file and allow access to its contents through the `get` method. Will update the configuration data if the underlying file is changed
