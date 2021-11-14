#!/usr/bin/env raku

use Test;
use IV::Stats;

my $stats = IV::Stats.new;
say $stats;

ok( $stats, "Can create object");
cmp-ok( $stats.objetivos-de('Asmilex'), ">=", 4, "Objetivos hechos");
cmp-ok( $stats.entregas-de('Asmilex'), ">=", 5, "Entregas hechas");
ok( "Asmilex" ∈ $stats.cumplieron-objetivo(4), "Conjuntos creados");

done-testing;