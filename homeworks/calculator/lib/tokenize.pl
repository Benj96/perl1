=head1 DESCRIPTION

Эта функция должна принять на вход арифметическое выражение,
а на выходе дать ссылку на массив, состоящий из отдельных токенов.
Токен - это отдельная логическая часть выражения: число, скобка или арифметическая операция
В случае ошибки в выражении функция должна вызывать die с сообщением об ошибке

Знаки '-' и '+' в первой позиции, или после другой арифметической операции стоит воспринимать
как унарные и можно записывать как "U-" и "U+"

Стоит заметить, что после унарного оператора нельзя использовать бинарные операторы
Например последовательность 1 + - / 2 невалидна. Бинарный оператор / идёт после использования унарного "-"

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

sub tokenize {
	
	my @res;

	# ...

while(my $expr = <STDIN>) {
  chomp($expr); # отсекаем символ \n
  last if($expr eq "exit");
  print "Вы ввели '$expr'. Для выхода из цикла введите exit\n";
}
my $number=qr/\d+/; # шаблон для числа/переменной
 
$arifm=qr#[+-]?(?:$number|\((??{$arifm})\))(?:[*/](?:$number|\((??{$arifm})\)))*
   (?:[+-](?:$number|\((??{$arifm})\))(?:[*/](?:$number|\((??{$arifm})\)))*)*#x;
 
print /^$arifm$/ ? "Верно: $_\n" : "Неверно: $_\n" for ($expr);
my @res=split // $expr;  

return \@res;
}

1;
