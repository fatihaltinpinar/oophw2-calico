//
// Created by faati on 21.04.2019.
//


#include "assignment2.cpp"

#ifndef MAX_OPERATOR_SIZE
#define MAX_OPERATOR_SIZE 30
#endif


int main() {
    ArithmeticOperator *plus = new ArithmeticOperator(3,3,1,'+');
    ArithmeticOperator *minus = new ArithmeticOperator(3, 8, 1, '-');
    ArithmeticOperator cross(8,3,1,'x');
    ArithmeticOperator division(8, 8, 1, '/');

    ArithmeticOperator borderplus(10,10,1,'+');
    ArithmeticOperator borderminus(10,10,1,'-');
    ArithmeticOperator bordercross(10,10,1,'x');
    ArithmeticOperator borderdivision(10,10,1,'/');

    OperatorGrid grid(10, 10);

    grid.place_operator(plus);
    grid.place_operator(minus);
    grid.place_operator(&cross);
    grid.place_operator(&division);

    grid.place_operator(&borderplus);
    grid.place_operator(&borderminus);
    grid.place_operator(&bordercross);
    grid.place_operator(&borderdivision);

    grid.place_operator(plus);
    grid.place_operator(minus);
    grid.place_operator(&cross);
    grid.place_operator(&division);

    ArithmeticOperator conflict_n_border(3, 10, 1, '+');
    grid.place_operator(&conflict_n_border);

    delete plus;
    delete minus;

/*
SUCCESS: Operator + with size 1 is placed on (3,3).
SUCCESS: Operator - with size 1 is placed on (3,8).
SUCCESS: Operator x with size 1 is placed on (8,3).
SUCCESS: Operator / with size 1 is placed on (8,8).
BORDER ERROR: Operator + with size 1 can not be placed on (10,10).
BORDER ERROR: Operator - with size 1 can not be placed on (10,10).
BORDER ERROR: Operator x with size 1 can not be placed on (10,10).
BORDER ERROR: Operator / with size 1 can not be placed on (10,10).
CONFLICT ERROR: Operator + with size 1 can not be placed on (3,3).
CONFLICT ERROR: Operator - with size 1 can not be placed on (3,8).
CONFLICT ERROR: Operator x with size 1 can not be placed on (8,3).
CONFLICT ERROR: Operator / with size 1 can not be placed on (8,8).
BORDER ERROR: Operator + with size 1 can not be placed on (3,10).
CONFLICT ERROR: Operator + with size 1 can not be placed on (3,10).
DESTRUCTOR: GIVE BACK[10,10] chars.
DESTRUCTOR: GIVE BACK[4] Operators.
 */

    return 0;
}