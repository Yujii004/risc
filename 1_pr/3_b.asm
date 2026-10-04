.include "sxema.s"
.eqv STUDENT_NUM 13
.eqv GROUP_NUM 138
.data
prompt: .asciz "x: "

.text
main:
    print_str(prompt)
    read_int(t0)
    li    t1, GROUP_NUM
    li    t2, STUDENT_NUM

    mv    t3, t0
    mv    t4, t1
minmax_done:
    blez  t2, end_for

for:
    bgt   t3, t4, end_for
    print_int(t3)
    print_char(' ')
    add   t3, t3, t2
    j     for
end_for:
    print_char('\n')
    exit
