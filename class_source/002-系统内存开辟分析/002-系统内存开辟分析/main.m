//
//  main.m
//  002-系统内存开辟分析
//
//  Created by cooci on 2020/9/5.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gladiator.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>



void testOne(void){
    // 验证，类信息，内存中只存在一份
    Class one = [Gladiator class];
    Class two = [Gladiator alloc].class;
    Class three = object_getClass([Gladiator alloc]);
    Class four = [Gladiator alloc].class;
    
    
    NSLog(@"\n%p - \n%p - \n%p - \n%p", one, two, three, four);
}






int main(int argc, const char * argv[]) {
    @autoreleasepool {
            
        // testOne();
        
        
        //  testTwo
        
        
        // NSObject 实例对象
        
        NSObject * obj = [NSObject alloc];
        
        // NSObject 类
        
        Class cls = object_getClass(obj);
        
        // NSObject 元类 , 即 根元类
        
        Class metaCls = object_getClass(cls);
        
        // NSObject 根元类，指向自身
        // 根元类
        
        Class rootMetaCls = object_getClass(metaCls);
        
        
        // NSObject 根元类，指向自身
        // 根根元类
    
        Class rootRootMetaCls = object_getClass(rootMetaCls);
        
        
        NSLog(@"\n实例对象  %p \n类  %p \n元类  %p \n根元类    %p \n根根元类    %p ", obj, cls, metaCls, rootMetaCls, rootRootMetaCls);
        
        
    }
    return 0;
}
