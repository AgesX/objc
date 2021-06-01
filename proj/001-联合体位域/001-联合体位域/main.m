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

        
        // 指针学习
        
        // 数组指针
        
        int arr[4] = { 11, 12, 13, 14 };
        for (int i = 0; i < 4; i ++){
            int val = arr[i];
            NSLog(@" %d ", val);
        }
        
        
        NSLog(@" 指针  -  内存偏移  ");
        
        
        
        
        
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
        
        
        // int 整型，占 4 个字节
        // 栈上， &a 和 &b, 相差 4 个字节
        
        
        
        //////
        
        
        
        
        // 可能深拷贝
        // 内存，内容拷贝
        
        
        
        
        
        
        
        // car 是二级指针, 也是对象指针
        // 他指向一个地址
        // 他自己有一个地址
        
        
        
        
        
        
        
        Bicycle *car = [[Bicycle alloc] init];
        
        Bicycle *rocket = [[Bicycle alloc] init];
        
        // 指针地址不同，指针指向的内容地址也不同
        NSLog(@"%@ -- %p", car, &car);
        
        NSLog(@"%@ -- %p", rocket, &rocket);
        
        // &car， 和 &rocket 代表的对象，的 isa, 指向同一片内存空间
        
        
        
        
        
        
        
        
        
        
        
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








