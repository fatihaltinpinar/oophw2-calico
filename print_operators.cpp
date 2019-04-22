#include "assignment2.cpp"

#ifndef MAX_OPERATOR_SIZE
#define MAX_OPERATOR_SIZE 30
#endif

int main() {
	OperatorGrid a(4,23);
	
    ArithmeticOperator succes_leftmost_up(2,2,1,'-');
    a.place_operator(&succes_leftmost_up);
    
    ArithmeticOperator succes_rightmost_down(3,22,1,'x');
    a.place_operator(&succes_rightmost_down);

    
    a.print_operators();
/*
SUCCESS: Operator - with size 1 is placed on (2,2).
SUCCESS: Operator x with size 1 is placed on (3,22).
ARITHMETIC_OPERATOR[-], CENTER_LOCATION[2,2], SIZE[1]
ARITHMETIC_OPERATOR[x], CENTER_LOCATION[3,22], SIZE[1]
DESTRUCTOR: GIVE BACK[4,23] chars.
DESTRUCTOR: GIVE BACK[2] Operators.

 */

    return 0;
}
