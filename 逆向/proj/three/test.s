//
//  test.s
//  one
//
//  Created by Jz D on 2021/9/18.
//



.text
.global _A,_B


_A:
    mov x0, #0xaaaa
    // 保护 / 保存， 你的 lr 寄存器
    // 遇到 bl,  lr 就会变

    // 将 lr, 保存到栈区域，才安全
    bl _B
    mov x0, #0xaaaa
    ret


_B:
    mov x0, #0xbbbb
    ret


// 死循环汇编

// 汇编要回去，CPU 需要保存过，回去的路径


// CPU 需要知道，怎么回去

//

//


//


//


//

// 想要回去, 涉及:

// 内存

// sp 寄存器

// 函数调用栈




