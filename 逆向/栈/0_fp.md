sp 指向栈顶，开口方向


<hr>


iOS 中，栈的开口方向，


是往低地址



<hr>

栈空间，足够

编译器，决定开口多少



<hr>

编译器，通过代码编译，

知道了你的代码的栈空间，

需要多少

<hr>


局部变量，参数，


放在栈里面


<hr>

函数名，是符号

不放在栈里面


<hr>


fp, 指向栈底， 


<hr>


<hr>

没有函数的嵌套调用的时候，


就不需要 fp



<hr>


<hr>


没有函数的嵌套调用的时候，


就不需要 fp


因为 sp 所指向的区域，都是你的


不需要边界



<hr>


<hr>


函数的嵌套，

意味着，

你的函数，还没有执行结束的时候，

又进入了一个新的函数



> 新的函数，也需要自己的调用栈