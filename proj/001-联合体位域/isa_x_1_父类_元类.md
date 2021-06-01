(lldb) po car
<LGCar: 0x10060e7b0>

(lldb) x/1gx 0x10060e7b0
0x10060e7b0: 0x011d8001000081a1
(lldb) po 0x011d8001000081a1 & 0x00007ffffffffff8ULL                                                                    // 类信息 
LGCar                                                                                                                                                 // 对象指向类

(lldb) po LGCar.class
LGCar

(lldb) po object_getClass(car)
LGCar

(lldb) x/1gx 0x011d8001000081a1 & 0x00007ffffffffff8ULL
error: memory read takes a start address expression with an optional end address expression.
Expressions should be quoted if they contain spaces or other special characters.
(lldb) p/x 0x011d8001000081a1 & 0x00007ffffffffff8ULL                                                                    // 类信息 的 地址
(unsigned long long) $4 = 0x00000001000081a0                                                                               // 从类的 isa 中，获取 class 信息，就是 shift cls 位域
(lldb) x/1gx 0x00000001000081a0                                                                                                        //  类指向元类
0x1000081a0: 0x00000001000081c8
(lldb) x/1gx LGCar.class
0x1000081a0: 0x00000001000081c8
(lldb) x/1gx object_getClass(car)
0x1000081a0: 0x00000001000081c8
(lldb) po 0x10060e7b0
<LGCar: 0x10060e7b0>

(lldb) p 0x10060e7b0
(long) $8 = 4301318064
(lldb) p/x 0x10060e7b0
(long) $9 = 0x000000010060e7b0
(lldb) x/1gx  0x011d8001000081a1
error: memory read failed for 0x11d800100008000
(lldb) x/1gx 0x00000001000081a0                                                                                                          // 父类/元类 信息的 地址
0x1000081a0: 0x00000001000081c8
(lldb) po 0x00000001000081c8                                                                                                                // 父类/元类 信息 
LGCar                                                                                                                                                       //  类指向元类

(lldb) p/x 0x00000001000081a0 & 0x00007ffffffffff8ULL
(unsigned long long) $11 = 0x00000001000081a0
(lldb) po 0x00000001000081a0
LGCar

(lldb) p/x 0x00000001000081c8 & 0x00007ffffffffff8ULL
(unsigned long long) $13 = 0x00000001000081c8
(lldb) po 0x00000001000081c8
LGCar

(lldb) 
