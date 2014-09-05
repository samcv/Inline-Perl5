#!/usr/bin/env perl6

use v6;
use Test;
use Inline::Perl5;

my $i = Inline::Perl5.new();

is $i.run('5'), 5;
is $i.run('"Perl 5"'), 'Perl 5';
is_deeply $i.run('[1, 2]'), [1, 2];
is_deeply $i.run('[1, [2, 3]]'), [1, [2, 3]];
is_deeply $i.run('{a => 1, b => 2}'), {a => 1, b => 2};
is_deeply $i.run('{a => 1, b => {c => 3}}'), {a => 1, b => {c => 3}};
is_deeply $i.run('[1, {b => {c => 3}}]'), [1, {b => {c => 3}}];
ok $i.run('undef') === Any, 'p5 undef maps to p6 Any';

$i.DESTROY;

done;

# vim: ft=perl6