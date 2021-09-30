//
//  test.s
//  one
//
//  Created by Jz D on 2021/9/18.
//



.text
.global _B


// 交换，寄存器里面的值


_B:
    sub sp, sp, #0x20           // 在 sp 原有的基础上，减去多少
    stp x0, x1, [sp, 0x10]           // x0、x1, 两个寄存器, 总共 16 个字节,   sp + 0x10
    ldp x1, x0, [sp, 0x10]      // 交换 x0 和 x1 的变量，   内存作为 temp
    add sp, sp, #0x20                // 开辟了多少，加多少
    ret




//

//


//


//


//






