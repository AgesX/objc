rebase ， 内存的偏移修正



<hr>



binding ,    符号绑定




<hr>







<hr>



我们的 app  （    mach - o   ）   , 


二进制文件中，


所有的方法  /  函数调用，都有一个相对地址 （  基于首地址的， 偏移地址   ）







<hr>




<hr>





运行到内存中，


每次都有一个 ASLR   (    安全机制   )



ASLR  ，会分配一个随机的值， 插入到二进制文件 mach - o 的开头


<hr>




<hr>




Address space layout randomization



{


   ASLR  ,  保证安全，

   
(  针对符号
解决虚拟地址，固定不变的安全隐患  ) 




}


位址空間配置隨機載入


<hr>




<hr>







不会因为 ASLR 分配的偏移，而内存溢出


内存有多大？


8 个字节


8 * 8 = 64 位





<hr>




<hr>



