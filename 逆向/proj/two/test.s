//
//  test.s
//  one
//
//  Created by Jz D on 2021/9/18.
//



.text
.global _B


_B:
    sub sp, sp, #0x20           // 在 sp 原有的基础上，减去多少
    stp x0, x1, [sp]           // x0、x1, 两个寄存器, 总共 16 个字节
    ret




//

//


//


//


//






