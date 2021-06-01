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

继承关系


`objc_object` 是根源，

所有的对象，都是以 `objc_object` 为模版，继承过来的












<hr>


<hr>




实例之间， 没有关系，

he he he 
