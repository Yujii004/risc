.macro read_int (%x)
    li    a7, 5
    ecall
    mv    %x, a0
.end_macro

.macro print_int (%x)
    li    a7, 1
    mv    a0, %x
    ecall
.end_macro

.macro print_char (%c)
    li    a7, 11
    li    a0, %c
    ecall
.end_macro

.macro print_str (%label)
    li    a7, 4
    la    a0, %label
    ecall
.end_macro

.macro exit
    li    a7, 10
    ecall
.end_macro
