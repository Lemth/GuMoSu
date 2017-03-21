/// @desc solver(list)
/// @arg list	argument0

//INIT
var hold=0;
var solved=true;

//BEGIN
var solver_inventory=ds_list_create();
for(var i=0;i<81;i++) {
	solver_inventory[| i]=ds_list_create();
	ds_list_copy(solver_inventory[| i],argument0[| i]);
}
//BEGIN

//Constraint Propagation
while(solver_RCR_complex(solver_inventory)) { }

//Search
for(var j=2;j<9;j++) {
	for(var i=0;i<81;i++) {
		if(ds_list_size(solver_inventory[| i])==j) {
			var hold=ds_list_create();
			ds_list_copy(hold,solver_inventory[| i]);
			ds_list_clear(solver_inventory[| i]);
			ds_list_add(solver_inventory[| i],hold[| 0]);
			if(solver(solver_inventory)) {
				//A solution!
				solved=true;
				break;
			} else {
				//No solution...
				solved=false;
			}
			break;
		}
	}
	if(hold!=0) {
		break;
	}
}


//END
for(var i=0;i<81;i++) {
	if(ds_list_size(solver_inventory[| i])!=1) {
		solved=false;
	}
	ds_list_destroy(solver_inventory[| i]);
}
ds_list_destroy(solver_inventory);
//END

return solved;

//http://norvig.com/sudoku.html

//http://pankaj-k.net/sudoku/sudoku.js

//http://web.archive.org/web/20070312010417/http://www.ecclestoad.co.uk/blog/2005/06/02/sudoku_solver_in_three_lines_explained.html

/* 

Sudoku solver in three lines explained

In previous posts I produced a four line sudoku solver and then went on to explain it. After having watched a C programmer's approach to it I am down to under three lines. Here it is and how it works.

use integer;@A=split//,<>;sub R{for$i(0..80){next if$A[$i];my%t=map{$_/9
==$i/9||$_%9==$i%9||$_/27==$i/27&&$_%9/3==$i%9/3?$A[$_]:0=>1}0..80;R($A[
$i]=$_)for grep{!$t{$_}}1..9;return$A[$i]=0}die@A}R
Above the obfu version, below the same code having been fed through perltidy. The code works as before - you feed in the sudoku grid on one line using zeros for the blanks. The code then spits out the solution in the same form.

use integer;                  	<----- does floor on all calculations until end of codeblock
@A = split //, <>;		<----- splits input into array of each value, input from command line

sub R {				<----- subroutine (script)
    for $i ( 0 .. 80 ) {	<----- loops throug 0 ~ 80
        next if $A[$i];		<----- continue IF value above 0. (already solution for this field)
        my %t = map {		<----- (my=var), %=hash (lib/ds_dictionary), map { name => value }
                 $_ / 9 == $i / 9	<-- $_ default == row numbers
              || $_ % 9 == $i % 9	<-- $_ default == column number
              || $_ / 27 == $i / 27 && $_ % 9 / 3 == $i % 9 / 3		<-- /27 && %9/3 (row/3 && column/3)
              ? $A[$_]			<-- CONDITION ? true : false, TRUE=
              : 0 => 1			<-- FALSE=0, value (for map)=1 (?????)
        } 0 .. 80;			<-- array 0 ~ 80 (to $_ ?????)
        R( $A[$i] = $_ ) for grep { !$t{$_} } 1 .. 9;		<-- execute "R" (where $A[$i] = $_ - argument0), for {!map values } between 1~9
        return $A[$i] = 0;		<-- 0?
    }
    die @A;				<-- exit; ?
}
R
The core difference is that in my four line version I stored the sudoku grid on a hash, whereas here I use an array. For convenience here is a sudoku grid where the numbers represent the index in the array:

 0  1  2    3  4  5    6  7  8
 9 10 11   12 13 14   15 16 17
18 19 20   21 22 23   24 25 26

27 28 29   30 31 32   33 34 35
36 37 38   39 40 41   42 43 44
45 46 47   48 49 50   51 52 53

54 55 56   57 58 59   60 61 62
63 64 65   66 67 68   69 70 71
72 73 74   75 76 77   78 79 80
I'll now run through the code explaining the various interesting bits.

use integer;
@A = split //, <>;
It is rare that obfus use modules but in this case it saved a few characters. Later on in the code I do a fair amount of integer mathematics, and without the use integer I would have to wrap up six of the expressions like so: int( $_ / 9 ).
OK
The second line puts the grid from STDIN onto an array @A.
OK
sub R {
    for $i ( 0 .. 80 ) {
        next if $A[$i];
The subroutine R is so called because it recurses. The main part of it is a for loop that runs over the whole grid. However if there is a value in the grid it skips on to the next position. $i is now the current position in the grid that we are looking to find a value for.
OK
        my %t = map {
                 $_ / 9 == $i / 9
              || $_ % 9 == $i % 9
              || $_ / 27 == $i / 27 && $_ % 9 / 3 == $i % 9 / 3
              ? $A[$_]
              : 0 => 1
        } 0 .. 80;
This is a bit hairy. I am creating a hash %t that will have as its keys the numbers that can not be used in this position, ie the ones that have been taken. The map contains a bool_expr ? if_true : if_false construct to determine what the key should be.
OK: on multiples; find peers singles and add those to dictionary. 1..9 => 1(true-meaningless)
The first three lines in the map are the boolean expressions to determine if $_ is in the same row, column or grid as $i. $_ / 9 == $i / 9 is for the row (remember that the division is integer so something like 12/9 equals 1). || $_ % 9 == $i % 9 is for the column and || $_ / 27 == $i / 27 && $_ % 9 / 3 == $i % 9 / 3 is for the grid (first part for grid row, second part for grid column). These are quite straight forward once you've gotten your head round them.
OK.
Really the booleans should have brackets round them to clear things up, however because Perl will stop evaluating them as soon as it finds one that is true the final && is ok.
OK.
Remember that the map is assigning a key/value pair to the hash. Well if these tests return true then the key is $A[$_], otherwise it is 0. The value is hard coded to true. I was surprised to find that the code for the key did not need to be in brackets, evidently the ?: is more tightly bound than => which is as you would expect.
OK
        R( $A[$i] = $_ ) for grep { !$t{$_} } 1 .. 9;
Three things happen here. The for loop runs for all the numbers that can be used in this position thanks to the grep { !$t{$_} } which filters out the numbers that have been used - they have a true value in the hash %t.
OK; loop 1 through 9. use value for this square that is NOT in the dictionary (peer-singles).
R( $A[$i] = $_ ) sets the current position to one of the possible values and then recurses.
OK; recurses with each possible value.
        return $A[$i] = 0;
If none of the values in the for loop lead to a solution, or if there were no values to try then we reset the current position to zero and return. This allows other values to be tried in the 'higher' calls to R.
OK;
    }
    die @A;
}
If the outermost for loop ever reaches the end (ie $i == 81) then we have our solution. Print it out and stop processing.
Ok;
R
The only thing left to do is to actually start running the code.
OK
So there we are, sudokus solved in three lines of Perl. In my opinion this is cleaner than my previous offerings as the logic is tighter. Still this obfu is not as short as it can get. There are two superfluous semicolons and the logic in the map could be shortened too, as well as some other bits.

*/

