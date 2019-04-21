//
// Created by faati on 21.04.2019.
//

#include "assignment2.cpp"

#ifndef MAX_OPERATOR_SIZE
#define MAX_OPERATOR_SIZE 30
#endif



int main() {
    ArithmeticOperator plus(3,3,1,'+');
    ArithmeticOperator minus(3, 8, 1, '-');
    ArithmeticOperator cross(8,3,1,'x');
    ArithmeticOperator division(8, 8, 1, '/');

    OperatorGrid grid(10, 10);

    grid.place_operator(&plus);
    grid.place_operator(&minus);
    grid.place_operator(&cross);
    grid.place_operator(&division);


    grid.move_operator(3,3,'U', 3);
    grid.move_operator(3,8,'R', 2);
    grid.move_operator(8,3,'L', 3);
    grid.move_operator(8,8,'D', 2);

    grid.move_operator(3, 3, 'R', 1);
    grid.move_operator(3, 4, 'R', 3);
    grid.move_operator(3, 4, 'R', 6);

/*
SUCCESS: Operator + with size 1 is placed on (3,3).
SUCCESS: Operator - with size 1 is placed on (3,8).
SUCCESS: Operator x with size 1 is placed on (8,3).
SUCCESS: Operator / with size 1 is placed on (8,8).
BORDER ERROR: + can not be moved from (3,3) to (0,3).
BORDER ERROR: - can not be moved from (3,8) to (3,10).
BORDER ERROR: x can not be moved from (8,3) to (8,0).
BORDER ERROR: / can not be moved from (8,8) to (10,8).
SUCCESS: + moved from (3,3) to (3,4).
CONFLICT ERROR: + can not be moved from (3,4) to (3,7).
BORDER ERROR: + can not be moved from (3,4) to (3,10).
CONFLICT ERROR: + can not be moved from (3,4) to (3,10).
DESTRUCTOR: GIVE BACK[10,10] chars.
DESTRUCTOR: GIVE BACK[4] Operators.
 */

    return 0;
}