//
//  LGRuntimeTool.m
//  005---Runtime应用
//
//  Created by cooci on 2019/2/16.
//  Copyright © 2019 cooci. All rights reserved.
//

#import "LGRuntimeTool.h"
#import <objc/runtime.h>

@implementation LGRuntimeTool


// method-swizzling
// sel - imp
// 方法流程
// api - 

+ (void)lg_bestMethodSwizzlingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzledSEL:(SEL)swizzledSEL{
    
    if (!cls) NSLog(@"传入的交换类不能为空");
    
    Method oriMethod = class_getInstanceMethod(cls, oriSEL);
    Method swiMethod = class_getInstanceMethod(cls, swizzledSEL);
    
    if (!oriMethod) { // 避免动作没有意义
        // 在oriMethod为nil时，替换后将swizzledSEL复制一个不做任何事的空实现,代码如下:
        class_addMethod(cls, oriSEL, method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
        method_setImplementation(swiMethod, imp_implementationWithBlock(^(id self, SEL _cmd){
            NSLog(@"来了一个空的 imp");
        }));
    }
    
    // 一般交换方法: 交换自己有的方法 -- 走下面 因为自己有意味添加方法失败
    // 交换自己没有实现的方法:
    //   首先第一步:会先尝试给自己添加要交换的方法 :personInstanceMethod (SEL) -> swiMethod(IMP)
    //   然后再将父类的IMP给swizzle  personInstanceMethod(imp) -> swizzledSEL
    //oriSEL:personInstanceMethod

    BOOL didAddMethod = class_addMethod(cls, oriSEL, method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    }else{
        method_exchangeImplementations(oriMethod, swiMethod);
    }
    
}
@end
