- Remove Place Output Check:
    run: rm -f place_output_check
    visible: false

- Remove Move Output Check:
    run: rm -f move_output_check
    visible: false

- Remove Place Check:
    run: rm -f place_check
    visible: false

- Remove Invalid Sign:
    run: rm -f invalid_sign
    visible: false
    
- Remove Print Operators:
    run: rm -f print_operators;
    visible: false

    
- Remove Input Reliability:
    run: rm -f input_reliability;
    visible: false

- Building Place Output Check:
    run: g++ -Wall -Werror place_output_check.cpp -o place_output_check  # timeout: 8
    blocker: true

- Building Move Output Check:
    run: g++ -Wall -Werror move_output_check.cpp -o move_output_check  # timeout: 8
    blocker: true

- Building Place Check:
    run: g++ -Wall -Werror place_check.cpp -o place_check  # timeout: 8
    blocker: true

- Building Invalid Sign:
    run: g++ -Wall -Werror invalid_sign.cpp -o invalid_sign  # timeout: 8
    blocker: true

- Build Print Operators:
    run: g++ -Wall -Werror print_operators.cpp -o print_operators  # timeout: 8
    blocker: true

- Build Input Reliability:
    run: g++ -Wall -Werror input_reliability.cpp -o input_reliability  # timeout: 8
    blocker: true


- Place Output Check:
    run: ./place_output_check
    points: 6
    scripts:
        - expect: "[ \r\n]*SUCCESS: Operator [+] with size 1 is placed on [(]3,3[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator - with size 1 is placed on [(]3,8[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator x with size 1 is placed on [(]8,3[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator / with size 1 is placed on [(]8,8[)].[ \r\n]*"    # timeout: 8

        - expect: "[ \r\n]*BORDER ERROR: Operator [+] with size 1 can not be placed on [(]10,10[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator - with size 1 can not be placed on [(]10,10[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator x with size 1 can not be placed on [(]10,10[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator / with size 1 can not be placed on [(]10,10[)].[ \r\n]*"    # timeout: 8

        - expect: "[ \r\n]*CONFLICT ERROR: Operator [+] with size 1 can not be placed on [(]3,3[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator - with size 1 can not be placed on [(]3,8[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator x with size 1 can not be placed on [(]8,3[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator / with size 1 can not be placed on [(]8,8[)].[ \r\n]*"  # timeout: 8

        - expect: "[ \r\n]*BORDER ERROR: Operator [+] with size 1 can not be placed on [(]3,10[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator [+] with size 1 can not be placed on [(]3,10[)].[ \r\n]*"  # timeout: 8

        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]10,10[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]4[]] Operators.[ \r\n]*"         # timeout: 8
    return: 0


- Move Output Check:
    run: ./move_output_check
    points: 6
    scripts:
        - expect: "[ \r\n]*SUCCESS: Operator [+] with size 1 is placed on [(]3,3[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator - with size 1 is placed on [(]3,8[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator x with size 1 is placed on [(]8,3[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator / with size 1 is placed on [(]8,8[)].[ \r\n]*"    # timeout: 8

        - expect: "[ \r\n]*BORDER ERROR: [+] can not be moved from [(]3,3[)] to [(]0,3[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: - can not be moved from [(]3,8[)] to [(]3,10[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: x can not be moved from [(]8,3[)] to [(]8,0[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: / can not be moved from [(]8,8[)] to [(]10,8[)].[ \r\n]*"         # timeout: 8

        - expect: "[ \r\n]*SUCCESS: [+] moved from [(]3,3[)] to [(]3,4[)].[ \r\n]*"              # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: [+] can not be moved from [(]3,4[)] to [(]3,7[)].[ \r\n]*"         # timeout: 8

        - expect: "[ \r\n]*BORDER ERROR: [+] can not be moved from [(]3,4[)] to [(]3,10[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: [+] can not be moved from [(]3,4[)] to [(]3,10[)].[ \r\n]*"         # timeout: 8


    return: 0


- Place Check:
    run: ./place_check
    points: 6
    script:
        - expect: "[ \r\n]*BORDER ERROR: Operator [+] with size 2 can not be placed on [(]3,-11[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator - with size 2 can not be placed on [(]2,33[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator / with size 2 can not be placed on [(]-12,10[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator x with size 2 can not be placed on [(]12,9[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator [+] with size 1 is placed on [(]2,2[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator x with size 1 is placed on [(]3,22[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator - with size 10 is placed on [(]1,13[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator - with size 9 is placed on [(]4,10[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator - with size 9 is placed on [(]3,12[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator [+] with size 1 can not be placed on [(]2,14[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator - with size 2 can not be placed on [(]1,4[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: Operator [+] with size 2 can not be placed on [(]1,4[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: Operator [+] with size 2 can not be placed on [(]1,4[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]4,23[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]5[]] Operators.[ \r\n]*"         # timeout: 8
        - expect: _EOF_                                                                        # timeout: 8
    return: 0

- Invalid Sign:
    run: ./invalid_sign
    points: 6
    script:
        - expect: "[ \r\n]*SIGN parameter is invalid![ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SIGN parameter is invalid![ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SIGN parameter is invalid![ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SIGN parameter is invalid![ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SIGN parameter is invalid![ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]4,23[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]0[]] Operators.[ \r\n]*"         # timeout: 8
        - expect: _EOF_                                                                        # timeout: 8
    return: 0

- Print Operators:
    run: ./print_operators
    points: 6
    script:
        - expect: "[ \r\n]*SUCCESS: Operator - with size 1 is placed on [(]2,2[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator x with size 1 is placed on [(]3,22[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*ARITHMETIC_OPERATOR[[]-[]], CENTER_LOCATION[[]2,2[]], SIZE[[]1[]][ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*ARITHMETIC_OPERATOR[[]x[]], CENTER_LOCATION[[]3,22[]], SIZE[[]1[]][ \r\n]*"  # timeout: 8        
        
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]4,23[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]2[]] Operators.[ \r\n]*"         # timeout: 8
        - expect: _EOF_                                                                        # timeout: 8
    return: 0

- Input Reliability:
    run: ./input_reliability
    points: 1
    script:
        - expect: "[ \r\n]*SUCCESS: Operator [+] with size 1 is placed on [(]3,3[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: [+] moved from [(]3,3[)] to [(]3,2[)].[ \r\n]*"              # timeout: 8
        
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]10,10[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]1[]] Operators.[ \r\n]*"         # timeout: 8
        - expect: _EOF_                                                                        # timeout: 8
    return: 0
