(lldb) x/1gx Bicycle.class                                                                          // 元类
0x1000081a0: 0x00000001000081c8
(lldb) p/x 0x00000001000081c8 & 0x00007ffffffffff8ULL
(unsigned long long) $3 = 0x00000001000081c8
(lldb) po 0x00000001000081c8    
Bicycle

(lldb) x/1gx 0x00000001000081c8
0x1000081c8: 0x00007fff808a6fe0
(lldb) po 0x00007fff808a6fe0                                                            // 根元类
NSObject

(lldb) p/x 0x00007fff808a6fe0  & 0x00007ffffffffff8ULL
(unsigned long long) $6 = 0x00007fff808a6fe0
(lldb) x/1gx 0x00007fff808a6fe0
0x7fff808a6fe0: 0x00007fff808a6fe0
(lldb) p/x NSObject.class                                                                   // 类
(Class) $7 = 0x00007fff808a7008 NSObject
(lldb) po 0x00007fff808a7008
NSObject

(lldb) p/x 0x00007fff808a7008 & 0x00007ffffffffff8ULL
(unsigned long long) $9 = 0x00007fff808a7008
(lldb) p/1gx 0x00007fff808a7008
error: this command doesn't support specifying a byte size
(lldb) po NSObject.class
NSObject

(lldb) p/x NSObject.class
(Class) $11 = 0x00007fff808a7008 NSObject
(lldb) p/1gx 0x00007fff808a7008
error: this command doesn't support specifying a byte size
(lldb) x/1gx 0x00007fff808a7008                                                   // 根元类
0x7fff808a7008: 0x00007fff808a6fe0
(lldb) po 0x00007fff808a6fe0
NSObject

(lldb) p/x 0x00007fff808a6fe0 & 0x00007ffffffffff8ULL
(unsigned long long) $13 = 0x00007fff808a6fe0
(lldb) po 0x00007fff808a6fe0
NSObject

(lldb) x/1gx 0x00007fff808a6fe0
0x7fff808a6fe0: 0x00007fff808a6fe0
(lldb) 
