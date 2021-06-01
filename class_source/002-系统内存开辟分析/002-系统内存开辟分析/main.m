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








int main(int argc, const char * argv[]) {
    @autoreleasepool {
            
        
        
        // 验证，类信息，内存中只存在一份
        Class one = [Gladiator class];
        Class two = [Gladiator alloc].class;
        Class three = object_getClass([Gladiator alloc]);
        Class four = [Gladiator alloc].class;
        
        
        NSLog(@"\n%p - \n%p - \n%p - \n%p", one, two, three, four);
    
        
        
        
    }
    return 0;
}
