- init:
    run: rm -f outputcheck
    blocker: true

- build:
    run: g++ -Wall -Werror outputcheck.cpp -o outputcheck  # timeout: 8
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




        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]10,10[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]4[]] Operators.[ \r\n]*"         # timeout: 8


    return: 0



- Border Error:
    run: ./base
    points: 10
    script:
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]10,7[]] chars.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*DESTRUCTOR: GIVE BACK[[]8[]] Operators.[ \r\n]*"         # timeout: 8
        - expect: "[ \r\n]*ARITHMETIC_OPERATOR[[][+][]], CENTER_LOCATION[[]4,2[]], SIZE[[]1[]].[ \r\n]*"         # timeout: 8
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

