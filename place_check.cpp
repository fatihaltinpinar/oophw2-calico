#include "assignment2.cpp"

#ifndef MAX_OPERATOR_SIZE
#define MAX_OPERATOR_SIZE 30
#endif

int main() {
	OperatorGrid a(4,23);
	
    ArithmeticOperator border_left_of_grid_plus(3,-11,2,'+');
    a.place_operator(&border_left_of_grid_plus);


    ArithmeticOperator border_right_of_grid_minus(2,33,2,'-');
    a.place_operator(&border_right_of_grid_minus);


    ArithmeticOperator border_above_of_grid_division(-12,10,2,'/');
    a.place_operator(&border_above_of_grid_division);


    ArithmeticOperator border_below_of_grid_cross(12,9,2,'x');
    a.place_operator(&border_below_of_grid_cross);

    
    ArithmeticOperator succes_leftmost_up(2,2,1,'+');
    a.place_operator(&succes_leftmost_up);

    
    ArithmeticOperator succes_rightmost_down(3,22,1,'x');
    a.place_operator(&succes_rightmost_down);


    ArithmeticOperator succes_up_long_minus(1,13,10,'-');
    a.place_operator(&succes_up_long_minus);

    
    ArithmeticOperator succes_down_long_minus(4,10,9,'-');
    a.place_operator(&succes_down_long_minus);

    
    ArithmeticOperator succes_middle_long_minus(3,12,9,'-');
    a.place_operator(&succes_middle_long_minus);

    
    ArithmeticOperator conflict_for_one_cell(2,14,1,'+');
    a.place_operator(&conflict_for_one_cell);

    
    ArithmeticOperator conflict_totaly(1,4,2,'-');
    a.place_operator(&conflict_totaly);

    
    ArithmeticOperator both_conflict_and_border(1,4,2,'+');
    a.place_operator(&both_conflict_and_border);

/*
BORDER ERROR: Operator + with size 2 can not be placed on (3,-11).
BORDER ERROR: Operator - with size 2 can not be placed on (2,33).
BORDER ERROR: Operator / with size 2 can not be placed on (-12,10).
BORDER ERROR: Operator x with size 2 can not be placed on (12,9).
SUCCESS: Operator + with size 1 is placed on (2,2).
SUCCESS: Operator x with size 1 is placed on (3,22).
SUCCESS: Operator - with size 10 is placed on (1,13).
SUCCESS: Operator - with size 9 is placed on (4,10).
SUCCESS: Operator - with size 9 is placed on (3,12).
CONFLICT ERROR: Operator + with size 1 can not be placed on (2,14).
CONFLICT ERROR: Operator - with size 2 can not be placed on (1,4).
BORDER ERROR: Operator + with size 2 can not be placed on (1,4).
CONFLICT ERROR: Operator + with size 2 can not be placed on (1,4).
DESTRUCTOR: GIVE BACK[4,23] chars.
DESTRUCTOR: GIVE BACK[5] Operators.
 */
    
    return 0;
}
