#include "assignment2.cpp"

int main() {
	OperatorGrid a(4,23);
	
    ArithmeticOperator border_left_of_grid_plus(3,-11,2,'+');
    a.place_operator(&border_left_of_grid_plus);
    //BORDER ERROR: Operator + with size 2 can not be placed on (3,-11).

    ArithmeticOperator border_right_of_grid_minus(2,33,2,'-');
    a.place_operator(&border_right_of_grid_minus);
    //BORDER ERROR: Operator - with size 2 can not be placed on (2,33).

    ArithmeticOperator border_above_of_grid_division(-12,10,2,'/');
    a.place_operator(&border_above_of_grid_division);
    //BORDER ERROR: Operator / with size 2 can not be placed on (-12,10).

    ArithmeticOperator border_below_of_grid_cross(12,9,2,'x');
    a.place_operator(&border_below_of_grid_cross);
    //BORDER ERROR: Operator x with size 2 can not be placed on (12,9).
    
    ArithmeticOperator succes_leftmost_up(2,2,1,'+');
    a.place_operator(&succes_leftmost_up);
    //SUCCESS: Operator + with size 1 is placed on (2,2).
    
    ArithmeticOperator succes_rightmost_down(3,22,1,'x');
    a.place_operator(&succes_rightmost_down);
    //SUCCESS: Operator x with size 1 is placed on (3,22).

    ArithmeticOperator succes_up_long_minus(1,13,10,'-');
    a.place_operator(&succes_up_long_minus);
    //SUCCESS: Operator - with size 10 is placed on (1,13).
    
    ArithmeticOperator succes_down_long_minus(4,10,9,'-');
    a.place_operator(&succes_down_long_minus);
    //SUCCESS: Operator - with size 9 is placed on (4,10).
    
    ArithmeticOperator succes_middle_long_minus(3,12,9,'-');
    a.place_operator(&succes_middle_long_minus);
    //SUCCESS: Operator - with size 9 is placed on (3,12)
    
    ArithmeticOperator conflict_for_one_cell(2,14,1,'+');
    a.place_operator(&conflict_for_one_cell);
    //CONFLICT ERROR: Operator + with size 1 can not be placed on (2,14).
    
    ArithmeticOperator conflict_totaly(1,4,2,'-');
    a.place_operator(&conflict_totaly);
    //CONFLICT ERROR: Operator - with size 2 can not be placed on (1,4).
    
    ArithmeticOperator both_conflict_and_border(1,4,2,'+');
    a.place_operator(&both_conflict_and_border);
    //BORDER ERROR: Operator + with size 2 can not be placed on (1,4).
    //CONFLICT ERROR: Operator + with size 2 can not be placed on (1,4).
    
    
    return 0;
    //DESTRUCTOR: GIVE BACK[4,23] chars.
	//DESTRUCTOR: GIVE BACK[0] Operators.
}
