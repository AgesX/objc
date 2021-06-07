//
//  main.m
//  003-cache_t脱离源码环境分析
//
//  Created by cooci on 2020/9/16.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"
#import <objc/runtime.h>

typedef uint32_t mask_t;  // x86_64 & arm64 asm are less efficient with 16-bits

struct lg_bucket_t {
    SEL _sel;
    IMP _imp;
};

struct lg_cache_t {
    struct lg_bucket_t * _buckets;
    mask_t _mask;
    uint16_t _flags;
    uint16_t _occupied;
};

struct lg_class_data_bits_t {
    uintptr_t bits;
};

struct lg_objc_class {
    Class ISA;
    Class superclass;
    struct lg_cache_t cache;             // formerly cache pointer and vtable
    struct lg_class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LGPerson *p  = [LGPerson alloc];
        Class pClass = [LGPerson class];  // objc_clas
        [p say1];
        [p say2];
        [p say3];
        [p say4];
         
        // _occupied  _mask 是什么  cup - 1
        // 会变化 2-3 -> 2-7
        // bucket 会有丢失  重新申请
        // 顺序有点问题  哈希
        
        // cache_t 底层原理
        // 线索 :
        
        struct lg_objc_class *lg_pClass = (__bridge struct lg_objc_class *)(pClass);
        NSLog(@"%hu - %u",lg_pClass->cache._occupied,lg_pClass->cache._mask);
        for (mask_t i = 0; i<lg_pClass->cache._mask; i++) {
            // 打印获取的 bucket
            struct lg_bucket_t bucket = lg_pClass->cache._buckets[i];
            NSLog(@"%@ - %p",NSStringFromSelector(bucket._sel),bucket._imp);
        }

        
        NSLog(@"Hello, World!");
    }
    return 0;
}
