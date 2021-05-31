2021-05-31 23:41:21.034360+0800 001-联合体位域[10356:417735] isBack:             FALSE
(lldb) po car
<LGCar: 0x10052d730>

(lldb) x/1gx car
0x10052d730: 0x011d8001000081a1
(lldb) po   0x011d8001000081a1 & 0x00007ffffffffff8ULL
LGCar

(lldb) p/x 0x011d8001000081a1 >> 3
(long) $3 = 0x0023b00020001034
(lldb) p/x  0x0023b00020001034 << 20
(long) $4 = 0x0002000103400000
(lldb) p/x >> 17
error: <user expression 5>:1:1: expected expression
>> 17
^
(lldb) p/x 0x0002000103400000 >> 17
(long) $5 = 0x00000001000081a0
(lldb) po 0x00000001000081a0
LGCar

(lldb) 
