objc_object ( 根对象 )   vs   objc_class ( Class ) ( NSObject ) ( isa )


对象   vs   NSObject 类




<hr>


<hr>





// objc_class 继承自 objc_object，

// 也就获得了成员变量 isa 


<hr>


<hr>







`struct objc_class : objc_object `


所以，




所有的，对象 + 类 + 元类， 都有 isa






<hr>


<hr>




`objc_object` 和普通的对象，之间的关系：



(  这里有一个，上层和下层的对接  )



继承关系


`objc_object` 是根源，

所有的对象，都是以 `objc_object` 为模版，继承过来的



> 换个问题，就是，Objective - C 、 C 和 CPP 之间的关系



<hr>

一般对象，都继承自 NSObject ,


NSObject 底层是， `objc_object` 




<hr>


NSObject , ( Objective - C )


的实现是

`objc_object` ， （ C / CPP ）


<hr>




实例之间， 没有关系，

he he he 



<hr>

<hr>

<hr>





//  定义一个 Class 类型

typedef struct objc_class *Class;


<hr>

<hr>

所有的 class,

都是通过这个模版  objc_class  ，

创建出来的


<hr>

<hr>
