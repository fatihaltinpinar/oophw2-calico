//
// Created by fatih on 22.04.2019.
//

#include "assignment2.cpp"

#ifndef MAX_OPERATOR_SIZE
#define MAX_OPERATOR_SIZE 30
#endif



int main() {
    ArithmeticOperator plus(3,3,1,'+');
    
    OperatorGrid grid(10, 10);

    grid.place_operator(&plus);
    plus.set_y(5);
    grid.move_operator(3,2,'L',1);
    
    
  


/*
SUCCESS: Operator + with size 1 is placed on (3,3).
SUCCESS: + moved from (3,3) to (3,2).
DESTRUCTOR: GIVE BACK[10,10] chars.
DESTRUCTOR: GIVE BACK[1] Operators.
 */

    return 0;
}
