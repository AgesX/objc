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

        
        //  值拷贝
        
        // 普通指针
        
        
        // a 是变量
        int a = 10;
        int b = 10;
        
        // 值相同，地址不同
        
        
        // 这里有一个，值拷贝
        
        
        
        NSLog(@"%d -- %p", a, &a);
        
        NSLog(@"%d -- %p", b, &b);
        
        // 栈上，地址是连续的
        
        
        
        
        //////
        
        
        
        
        // 可能深拷贝
        // 内存，内容拷贝
        
        
        
        
        
        // car 是指针
        
        Bicycle *car = [[Bicycle alloc] init];
        
        Bicycle *rocket = [[Bicycle alloc] init];
        
        // 指针地址不同，指针指向的内容地址也不同
        NSLog(@"%@ -- %p", car, &car);
        
        NSLog(@"%@ -- %p", rocket, &rocket);
        
        
        
        //////
        
        
        
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

