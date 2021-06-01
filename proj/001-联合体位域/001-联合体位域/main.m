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






