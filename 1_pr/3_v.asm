.include "sxema.s"
.eqv STUDENT_NUM 13
.data
    .align 2
array:  .space 400
msg_cnt: .asciz "Кол-во элементов: "
msg_arr: .asciz "Массив: "
.text
main:
    li    s1, 16
    addi  s1, s1, STUDENT_NUM

    la    a0, array             # a0 адрес массива
    mv    a1, s1                # a1 максимальное число элементов
    jal   ra, fill_array        # a0 количество считанных элементов
    mv    s2, a0                # s2 count

    print_str(msg_cnt)
    print_int(s2)
    print_char('\n')

    print_str(msg_arr)
    la    a0, array
    mv    a1, s2
    jal   ra, print_array
    print_char('\n')
    exit

fill_array:
    mv    t1, a0
    mv    t2, zero
while:
    beq   t2, a1, end_while
    li    a7, 5
    ecall
    beqz  a0, end_while
    sw    a0, 0(t1)
    addi  t1, t1, 4
    addi  t2, t2, 1
    j     while
end_while:
    mv    a0, t2
    jalr  zero, 0(ra)

print_array:
    mv    t1, a0
    mv    t2, a1
next:
    beqz  t2, end_print
    lw    t0, 0(t1)
    print_int(t0)
    print_char(' ')
    addi  t1, t1, 4
    addi  t2, t2, -1
    j     next
end_print:
    jalr  zero, 0(ra)
