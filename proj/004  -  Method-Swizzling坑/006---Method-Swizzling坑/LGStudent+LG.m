//
//  LGStudent+LG.m
//  006---Method-Swizzling坑
//
//  Created by cooci on 2019/2/16.
//  Copyright © 2019 cooci. All rights reserved.
//

#import "LGStudent+LG.h"
#import "LGRuntimeTool.h"
#import <objc/runtime.h>

@implementation LGStudent (LG)










// method-swizzling
// 1: 一次性问题 - load - 阻碍启动 - initizl
// 2:







+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        
        
        [LGRuntimeTool lg_methodSwizzlingWithClass:self oriSEL:@selector(personInstanceMethod) swizzledSEL:@selector(lg_studentInstanceMethod)];
    });
    
    
    //    666，  子类中，方法交换
    
    //    把其父类的，给处理了
    
    
    
    /*
                    method Swizzling， 只是查找，对象里面，对应的 IMP
                        
                    方法交换, 实际上，就是一个方法查找流程
                            如果，方法里面，没有 sel 对应的 IMP.
                                    就找其父类，一路递归上去
     
     
     
     
     
     
     
                    交换的是， IMP,
                    跟对象，没有关系
     
     
     
     
     
     
     
                
     
     
     */
}











// personInstanceMethod 我需要父类的这个方法的一些东西
// 给你加一个personInstanceMethod 方法
// imp

// 是否递归
- (void)lg_studentInstanceMethod{
    [self lg_studentInstanceMethod]; //lg_studentInstanceMethod -/-> personInstanceMethod
    NSLog(@"LGStudent分类添加的lg对象方法:%s",__func__);
}

@end
