#!/usr/bin/perl

use strict;
use warnings;
use lib './';

use TimeParser;


my $result = TimeParser::to_24_hours('24:00');
print "$result\n";


$result = TimeParser::to_24_hours('1:30pm');
print "$result\n";


$result = TimeParser::to_24_hours('13:00');
print "$result\n";
