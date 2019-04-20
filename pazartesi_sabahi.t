- init:
    run: rm -f assignment2
    blocker: true

- build:
    run: g++ assignment2.cpp -o assignment2  # timeout: 8
    blocker: true