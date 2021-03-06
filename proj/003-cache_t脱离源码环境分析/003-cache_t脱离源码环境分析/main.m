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

struct deng_preopt_cache_entry_t {
    uint32_t sel_offs;
    uint32_t imp_offs;
};

/* dyld_shared_cache_builder and obj-C agree on these definitions */
struct deng_preopt_cache_t {
    int32_t  fallback_class_offset;
    union {
        struct {
            uint16_t shift       :  5;
            uint16_t mask        : 11;
        };
        uint16_t hash_params;
    };
    uint16_t occupied    : 14;
    uint16_t has_inlines :  1;
    uint16_t bit_one     :  1;
    struct deng_preopt_cache_entry_t entries[];
};












struct lg_cache_t {
    
    
    // 拿到 _bucketsAndMaybeMask 的指针地址， 通过一个掩码 ，
    
    // 得到 buckets 和 mask 信息
    
    
    // 内存分为两段
    
    // 一段是 buckets
    
    // 另一段是 mask
    
    
    uintptr_t _bucketsAndMaybeMask;
    
    
    
    
    union {
        struct {
            mask_t    _maybeMask;
            uint16_t                   _flags;
            
            
            // 第 4 个，成员变量
            // 2 个字节
            uint16_t                   _occupied;
        };
        struct deng_preopt_cache_t * _originalPreoptCache;
    };
        
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
        LGPerson *p  = [LGPerson alloc];    // 走了 alloc 方法,  p 就是一个对象了
        
        
        
        
        // objc_msgSend 发消息决定， cache_t 什么时候，开始写
        
        // cache_t 怎么写，什么数据结构， 怎么保存，分析过了
        
        
        
        
        Class pClass = [LGPerson class];  // objc_clas
        
        struct lg_objc_class *lg_pClass = (__bridge struct lg_objc_class *)(pClass);
        
        
        [p init];    // 调用 init 方法， cache_t 信息也会变化
        
        
        NSLog(@"A ：   总共占用内存为 %hu -- \n -- 边界为 %u",lg_pClass->cache._occupied,   lg_pClass->cache._maybeMask);
        
        p.lgName = @"aaa";              // 调用 setter 方法， cache_t 信息也会变化
        
        
        
        // cache_t 复位
        p.nickName = @"aaa";
        
        
        
        
        NSLog(@"B ：   总共占用内存为 %hu -- \n -- 边界为 %u",lg_pClass->cache._occupied,   lg_pClass->cache._maybeMask);
        
        
        
        [p say1];
        [p say2];
        
        
        NSLog(@"先：   总共占用内存为 %hu -- \n -- 边界为 %u",lg_pClass->cache._occupied,   lg_pClass->cache._maybeMask);
        [p say3];
        [p say4];
         
        // _occupied  ,  _mask 是什么
        // mask_t m = capacity - 1;
        
        
        // 会变化   2-3    ->     2-7
        
        
        
        

        // _occupied , 2 - 2 ， 有一个 reset
        // _mask , 3 - 7,
        // 3 + 1 = 4
        // 7 + 1 = 8
        // 有一个加倍扩容的操作
        
        
        
        
        // bucket 会有丢失
        // 重新申请内存，因为扩容
        
        
        
        // 顺序有点问题
        // 下标，是通过哈希
        
        
        
        
        
        
        
        // cache_t 底层原理
        
        
        
        // 当前的缓存是怎么插入进去的 ?
        // 方法插入缓存 cache 的过程中，发生了什么事情？
        
        // bucket 是怎么对 SEL 和 IMP 赋值的，为什么会出现乱序和丢失
        
        
        
        
        // 线索 :
        
        NSLog(@"后：   总共占用内存为 %hu -- \n -- 边界为 %u",lg_pClass->cache._occupied,   lg_pClass->cache._maybeMask);
        
        
        
        
//        for (mask_t i = 0; i<lg_pClass->cache._mask; i++) {
//            // 打印获取的 bucket
//            struct lg_bucket_t bucket = lg_pClass->cache._buckets[i];
//            NSLog(@"%@ - %p",NSStringFromSelector(bucket._sel),bucket._imp);
//        }


    }
    return 0;
}
