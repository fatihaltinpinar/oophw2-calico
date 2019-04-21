//
// Created by faati on 21.04.2019.
//

#include <iostream>
#define MAX_OPERATOR_SIZE 20

#include "assignment2.cpp"



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



    return 0;
}