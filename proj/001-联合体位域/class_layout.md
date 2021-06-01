

/*
 
 (lldb) p/x Bicycle.class
 (Class) $1 = 0x00000001000081a0 Bicycle
 
 
 
 
 
 
 
 
 // p, 打印
 // x, 16 进制
 // p/x , 以 16 进制，打印
 
 
 
 
 
 
 
 
 
 (lldb) x/4gx 0x00000001000081a0
 0x1000081a0: 0x00000001000081c8 （  这个是 Bicycle 的元类  ） 0x00007fff808a7008  （ 这个是父类 ）
 0x1000081b0: 0x0000000100613f00 0x0001801800000007
 (lldb) po 0x00007fff808a7008
 NSObject

 (lldb) p/x NSObject.class
 (Class) $3 = 0x00007fff808a7008 NSObject
 
 （ 类 NSObject ）
 
 (lldb) x/1gx 0x00007fff808a7008
 0x7fff808a7008: 0x00007fff808a6fe0
 
 （ 元类 NSObject ）
 
 
 (lldb) x/1gx 0x00000001000081c8
 0x1000081c8: 0x00007fff808a6fe0
 (lldb)
 
 
 */






