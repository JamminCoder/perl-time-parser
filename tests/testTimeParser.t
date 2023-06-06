use strict;
use warnings;

use lib './';
use Test::More;

use TimeParser;

use_ok('TimeParser');

subtest 'PM converts to 24 hours' => sub {
    is(TimeParser::to_24_hours('1:00pm'), '13:00');
    is(TimeParser::to_24_hours('11:31pm'), '23:31');
};

subtest 'AM converts to 24 hours' => sub {
    is(TimeParser::to_24_hours('1:00'), '01:00');
    is(TimeParser::to_24_hours('12:00am'), '00:00');
    is(TimeParser::to_24_hours('11:00'), '11:00');
};

subtest 'Shorthand hours converts to 24 hours' => sub {
    is(TimeParser::to_24_hours('1am'), '01:00');
    is(TimeParser::to_24_hours('1pm'), '13:00');
};

done_testing();
