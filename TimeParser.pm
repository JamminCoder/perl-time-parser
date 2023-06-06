package TimeParser;

use strict;
use warnings;


my $meridiam_pattern = qr/(am|pm)$/i;
my $hours_pattern = qr/^(\d+)\D/;
my $minutes_pattern = qr/:(\d+)/;

sub get_hours {
    my ($time_str) = @_;
    return $1 if $time_str =~ $hours_pattern;
}

sub get_minutes {
    my ($time_str) = @_;
    return $1 if $time_str =~ $minutes_pattern; 
    return '00';
}

sub get_meridiam {
    my ($time_str) = @_;
    return lc $1 if $time_str =~ $meridiam_pattern;

    my $hours = get_hours $time_str;
    return 'am' if $hours < 12 || $hours == 24;
    return 'pm';
}

sub hours_24 {
    my ($time_str) = @_;
    my $meridiam = get_meridiam $time_str;
    my $hours = get_hours $time_str;

    $hours += 12 if $hours < 12 && $meridiam eq 'pm';
    
    # 24:00 is 00:00
    $hours = 0 if $hours == 12 && $meridiam eq 'am';
    
    # ensure double-digit hours
    $hours = "0$hours" if length $hours == 1;

    return $hours;
}

sub to_24_hours {
    my ($time_str) = @_;

    my $hours = hours_24 $time_str;
    my $minutes = get_minutes $time_str;

    return "$hours:$minutes";
}

1;
