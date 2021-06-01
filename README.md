# objc
based on     LGCooci/objc4_debug




<hr>


#### non pointer isa


大部分自定义的类，

都是 non pointer isa


<hr>



#### 认识堆和栈 

![heap](https://github.com/AgesX/objc/blob/main/imgs/002_1.png?raw=true)




<hr>


<hr>


<hr>





#### 位域计算，就是 mask



或者位运算，左右移动







> 位域： 位的信息布局



<hr>


<hr>


<hr>


![isa 指向图](https://github.com/AgesX/objc/blob/main/isa.png?raw=true)

对象的 isa , 指向类，




（ 类是一个对象，类对象     ）



类的 isa , 指向元类 meta class



元类 meta class 的  isa , 指向 NSObject ( 根元类 ， root meta )


>  NSObject ( 根元类 ， root meta ) 的  isa , 指向 NSObject ( 根元类 ， root meta )



>  NSObject ( 根元类 ， root meta ) 的  isa , 指向他自己





<hr>

NSObject ( 元类 )

与 NSObject ( 类 ) 不同的 


<hr>


NSObject  的类，有两个



第二个  NSObject  的类



<hr>


NSObject， 根类，

root


<hr>



苹果的设计中，


类是对象

类就会有方法、协议和属性









<hr>


<hr>



元类的定义，和创建，

都是由编译器自动完成






<hr>



***感觉，类信息，就是元类***

<hr>




面试题:


类、类对象和类信息，


在类里面，存在几份?



（ 类，存在几份  ）


<hr>

类的信息，在内存里面，只存在一份

（  好像是个结构体  ）

<hr>



可以定义多个，类对象




*可同时存在多个 NSObject*

呵呵

也就两个



* NSObject 类

* NSObject 根元类
