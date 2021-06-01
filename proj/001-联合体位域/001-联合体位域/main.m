//
//  main.m
//  001-联合体位域
//
//  Created by cooci on 2020/9/8.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>


#import "Bicycle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Bicycle *car = [[Bicycle alloc] init];
        
        NSLog(@"isBack:             %@", [car isBack]  ? @"TRUE": @"FALSE");
        
        
        
        car.front  = 1;
        car.back   = 0;
//        car.left   = 0;
//        car.right  = 1;
        
        car.front = YES;
        car.back  = YES;
        
        NSLog(@"isBack   now :             %@", [car isBack]  ? @"TRUE": @"FALSE");
    }
    return 0;
}



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






//  ISA_MASK





/*
 
 
 
 // 通过 ISA_MASK ，把类信息，取出来

 #   define ISA_MASK        0x00007ffffffffff8ULL
 
 
 
 
 */



/*
 
 
 
 (lldb) po car
 <Bicycle: 0x10055dae0>

 (lldb) x/8gx car
 0x10055dae0: 0x011d8001000081a1 0x0000000000000000
 0x10055daf0: 0x6c6f6f54534e5b2d 0x656c6c6f43726162
 0x10055db00: 0x6569566e6f697463 0x6573206d65744977
 0x10055db10: 0x6573657270655274 0x656a624f6465746e
 (lldb) po  0x011d8001000081a1
 80361110145892769

 (lldb) po 0x011d8001000081a1 & 0x00007ffffffffff8ULL
 Bicycle
 
 
 
 
 
 
 
 // 这个 &, 与
 // 就是做了一些，左右移的位运算
 
 */






