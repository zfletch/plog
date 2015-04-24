#!/usr/bin/env perl

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use warnings;
use Getopt::Long;

my ($start, $end, $help) = qw(START END);
GetOptions('help' => \$help, 'start=s' => \$start, 'end=s' => \$end);

print "usage: plog [-h] [-s START] [-e END] [file ...]\n" and exit if ($help);

while (<>) { print if /\Q$start\E/../\Q$end\E/; }
