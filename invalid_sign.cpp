#include "assignment2.cpp"

#ifndef MAX_OPERATOR_SIZE
#define MAX_OPERATOR_SIZE 30
#endif

int main() {
	OperatorGrid a(4,23);
	
    ArithmeticOperator plus(3,2,2,'+');
    ArithmeticOperator minus(3,2,2,'-');
    ArithmeticOperator division(3,2,2,'/');
    ArithmeticOperator cross(3,2,2,'x');
    ArithmeticOperator invalid1(3,2,2,' ');
    ArithmeticOperator invalid2(3,2,2,'\0');
    ArithmeticOperator invalid3(3,2,2,'.');
    ArithmeticOperator invalid4(3,2,2,'p');
    ArithmeticOperator invalid5(3,2,2,'i');
    
   /*
SIGN parameter is invalid!
SIGN parameter is invalid!
SIGN parameter is invalid!
SIGN parameter is invalid!
SIGN parameter is invalid!
DESTRUCTOR: GIVE BACK[4,23] chars.
DESTRUCTOR: GIVE BACK[0] Operators.
    */
    return 0;
}
