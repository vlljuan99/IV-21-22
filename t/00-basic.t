#!/usr/bin/env raku

use Test;
use IV::Stats;

my $stats = IV::Stats.new;
say $stats;

ok( $stats, "Can create object");
say $stats;
done-testing;