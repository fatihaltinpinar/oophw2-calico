- Remove Output Check:
    run: rm -f outputcheck;
    visible: false

- Remove Place Check:
    run: rm -f place_check;
    visible: false

- Build Output Check:
    run: g++ -Wall -Werror outputcheck.cpp -o outputcheck  # timeout: 8
    blocker: true
    
- Build Place Check:
    run: g++ -Wall -Werror place_check.cpp -o place_check  # timeout: 8
    blocker: true


- Output Check:
    run: ./outputcheck
    points: 10
    script:
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

        - expect: "[ \r\n]*BORDER ERROR: [+] can not be moved from [(]3,3[)] to [(]0,3[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: - can not be moved from [(]3,8[)] to [(]3,10[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: x can not be moved from [(]8,3[)] to [(]8,0[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*BORDER ERROR: / can not be moved from [(]8,8[)] to [(]10,8[)].[ \r\n]*"         # timeout: 8

        - expect: "[ \r\n]*SUCCESS: [+] moved from [(]3,3[)] to [(]3,4[)].[ \r\n]*"              # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: [+] can not be moved from [(]3,4[)] to [(]3,7[)].[ \r\n]*"         # timeout: 8

        - expect: "[ \r\n]*BORDER ERROR: [+] can not be moved from [(]3,4[)] to [(]3,10[)].[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*CONFLICT ERROR: [+] can not be moved from [(]3,4[)] to [(]3,10[)].[ \r\n]*"         # timeout: 8

        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]10,10[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]4[]] Operators.[ \r\n]*"         # timeout: 8


    return: 0



- Place Check:
    run: ./place_check
    points: 10
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


- case2:
    run: ./assignment
    points: 10
    script:
        - expect: "[ \r\n]*A grid is created: 7 7[ \r\n]*"                                     # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator - with size 1 is placed on [(]7,6[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator [+] with size 1 is placed on [(]3,5[)].[ \r\n]*"  # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator x with size 1 is placed on [(]5,3[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: Operator / with size 1 is placed on [(]2,4[)].[ \r\n]*"    # timeout: 8
        - expect: "[ \r\n]*SUCCESS: - moved from [(]7,6[)] to [(]6,6[)].[ \r\n]*"              # timeout: 8
        - expect: "[ \r\n]*SUCCESS: [+] moved from [(]3,5[)] to [(]3,6[)].[ \r\n]*"            # timeout: 8
        - expect: "[ \r\n]*SUCCESS: x moved from [(]5,3[)] to [(]6,3[)].[ \r\n]*"              # timeout: 8
        - expect: "[ \r\n]*SUCCESS: / moved from [(]2,4[)] to [(]2,3[)].[ \r\n]*"              # timeout: 8
        - expect: _EOF_                                                                        # timeout: 8
    return: 0

