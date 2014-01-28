package FuzzBuzz;

use strict;
use warnings;
use Test::More 'no_plan';
# use Test::Pretty;

sub fizzbuzz {
    my @results = map { my $n = $_; $n = &convert($n); $n } @_;
    return \@results;
}

sub convert {
    my ($num) = @_;
    return "FizzBuzz" if($num % 15 == 0);
    return "Buzz" if($num % 5 == 0);
    return "Fizz" if($num % 3 == 0);
    return $num;
}

subtest "fizzbuzz" => sub {
    subtest "fizzbuzz配列に変換できること" => sub {
        is_deeply(&fizzbuzz(1..15),
                        [1, 2, "Fizz", 4, "Buzz",
                        "Fizz", 7, 8, "Fizz", "Buzz",
                        11, "Fizz", 13, 14, "FizzBuzz"]);
    };
};

subtest "convert" => sub {
    subtest "15の倍数はBuzzを返すこと" => sub {
        is &convert(15), 'FizzBuzz';
        is &convert(45), 'FizzBuzz';
    };

    subtest "5の倍数はBuzzを返すこと" => sub {
        is &convert(5), 'Buzz';
        is &convert(25), 'Buzz';
    };

    subtest "3の倍数はFizzを返すこと" => sub {
        is &convert(3), 'Fizz';
        is &convert(99), 'Fizz';
    };

    subtest "整数を返すこと" => sub {
        is &convert(1), 1;
        is &convert(2), 2;
        is &convert(4), 4;
    };
};
