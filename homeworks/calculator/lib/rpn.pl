=head1 DESCRIPTION

Эта функция должна принять на вход арифметическое выражение,
а на выходе дать ссылку на массив, содержащий обратную польскую нотацию
Один элемент массива - это число или арифметическая операция
В случае ошибки функция должна вызывать die с сообщением об ошибке

=cut

use 5.010;
use strict;
use warnings;
use diagnostics;
BEGIN{
	if ($] < 5.018) {
		package experimental;
		use warnings::register;
	}
}
no warnings 'experimental';
use FindBin;
require "$FindBin::Bin/../lib/tokenize.pl";

sub rpn {
	my $expr = shift;
	my $source = tokenize($expr);
	

	# ...
my @rpn;
while (1) {
 
    print '$ ';
    my $expr = <STDIN>;
    chomp $expr;
 
    given ($expr) {
        when ("q") { last; }
        when ("c") { 
            pop @rpn; 
            }   
        when ("*") { 
            my $x = pop(@rpn);
            my $y = pop(@rpn);
            push(@rpn, $x*$y);
            }
        when ("+") { 
            my $x = pop(@rpn);
            my $y = pop(@rpn);
            push(@rpn, $x + $y);
            }
        when ("/") {
            my $x = pop(@rpn);
            my $y = pop(@rpn);
            push(@rpn, $y /  $x); 
            }
        when ("-") { 
            my $x = pop(@rpn);
            my $y = pop(@rpn);
            push(@rpn, $y - $x);
            }
        when ("=") { 
            print pop(@rpn); 
            }
        default { push @rpn, $expr; }
    }
}


	return \@rpn;
}

1;
