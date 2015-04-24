#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $result;

$result = `../plog.pl plog_test_file`;

say($result eq <<RESULT
START
nope
END
START
yes
END
RESULT
? '[passed] basic test' : '[FAILED] basic test');

$result = `../plog.pl plog_test_file --help`;

say($result eq <<RESULT
usage: plog [-h] [-s START] [-e END] [file ...]
RESULT
? '[passed] help test' : '[FAILED] help test');

$result = `../plog.pl plog_test_file -s nope -e yes`;

say($result eq <<RESULT
nope
END
goodbye
world
START
yes
RESULT
? '[passed] custom start end test' : '[FAILED] custom start end test');

$result = `../plog.pl plog_test_file -s '.'`;

say($result eq <<RESULT
RESULT
? '[passed] regex injection test' : '[FAILED] rejex injection test');
