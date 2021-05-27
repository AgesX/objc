//
//  main.m
//  002-系统内存开辟分析
//
//  Created by cooci on 2020/9/5.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 16 字节对齐
        // class_getInstanceSize, 对象需要的真正的内存
        // 占用内存 40 个字节， 采用 8 字节对齐
        
        
        
        // 16 字节对齐 苹果方向 128 512
        // malloc_size 非常简单 分享一个方法 源码阅读技巧
        
        LGPerson *person = [LGPerson alloc];
        person.name      = @"Cooci";
        person.nickName  = @"KC";
        NSLog(@"%@ - %lu - %lu - %lu\n\n\n",person,sizeof(person),class_getInstanceSize([LGPerson class]),malloc_size((__bridge const void *)(person)));
    }
    return 0;
}
