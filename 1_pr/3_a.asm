.include "sxema.s"
.eqv STUDENT_NUM 13
.data
prompt: .asciz "x: "

.text
main:
    print_str(prompt)
    read_int(t0)
    li    t2, STUDENT_NUM

if_equal:
    bne   t0, t2, else
    li    t1, 1
    j     end_if
else:
    li    t1, 0
end_if:
    print_int(t1)
    print_char('\n')
    exit
