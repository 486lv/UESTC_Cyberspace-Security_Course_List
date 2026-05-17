# Adds two numbers together, 5+7

        .text            # indicates the start of code

main:                    # always start with main
        # add the numbers
        addi $t0, $zero, 5
        addi $t1, $zero, 7
        add  $t2, $t0,   $t1

        beq  $0,  $0,    main
        sll  $0,  $0,    0

        .end main