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
        
        // 数组指针, 可通过地址平移，来获取信息
        
        int arr[4] = { 11, 12, 13, 14 };
        
        
        // 用地址指针，来还原
        int *addr = arr;            // addr 也就是，数组 arr 的首地址
        //  也即是数组 arr 中，第一个元素的地址
        
        
        NSLog(@"%p  -  %p  -  %p", &arr, &arr[0], &arr[1]);
        NSLog(@"%p  -  %p  -  %p\n - \n -", addr, addr + 1, addr + 2);
        // addr + 1, arr 中第二个元素的地址
        // addr + 1, addr 对应的地址，移动 4 个字节
        
        
        // addr + 2, arr 中第 3 个元素的地址
        
        
        // p *(addr + 2),
        // 反向取值， 取数组 arr 中第 3 个元素的值
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        for (int i = 0; i < 4; i ++){
            int val = arr[i];
            int valByAddr = *(addr + i);
            NSLog(@" %d - 换一种， - %d - \n --  ", val, valByAddr);
        }
        
        
        NSLog(@" 数组指针  -  内存偏移 - \n - - 内存平移 - - \n  ");
        
        // 反应到， OC 的类的结构上
        // Bicycle.class
        // 通过对地址的平移，分析所有的值
        
        
//////
        
        
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








