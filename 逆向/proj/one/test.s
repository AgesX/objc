//
//  test.s
//  one
//
//  Created by Jz D on 2021/9/18.
//



.text
.global _A,_B


_A:
    mov x0, #0xa0
    mov x1, #0x00
    add x1, x0, #0x14
    mov x0, x1
    bl _B
    mov x0, #0x0
    ret

_B:
    add x0, x0, #0x10
    ret







