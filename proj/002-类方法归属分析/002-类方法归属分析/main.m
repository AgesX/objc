//
//  main.m
//  002-类方法归属分析
//
//  Created by cooci on 2020/9/12.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"
#import "LGTeacher.h"
#import <objc/runtime.h>

#ifdef DEBUG
#define LGLog(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define LGLog(format, ...);
#endif






// 把类里面的对象方法，都找出来
void lgObjc_copyMethodList(Class pClass){
    unsigned int count = 0;
    Method *methods = class_copyMethodList(pClass, &count);
    for (unsigned int i=0; i < count; i++) {
        Method const method = methods[i];
        //获取方法名
        NSString *key = NSStringFromSelector(method_getName(method));
        
        LGLog(@"Method, name: %@", key);
    }
    free(methods);
}









//  查询类与  meta 元类的， 方法信息
void instanceMethod_classToMetaclassXx(Class pClass){
    
    const char *className = class_getName(pClass);
    Class metaClass = objc_getMetaClass(className);
    
    Method method1 = class_getInstanceMethod(pClass, @selector(sayHello));
    Method method2 = class_getInstanceMethod(metaClass, @selector(sayHello));

    Method method3 = class_getInstanceMethod(pClass, @selector(sayHappy));
    Method method4 = class_getInstanceMethod(metaClass, @selector(sayHappy));
    
    LGLog(@"%s  -  %p  -  %p  -  %p  -  %p  -  ",__func__,method1,method2,method3,method4);
    // instanceMethod_classToMetaclassXx  -  0x1000081b0  -  0x0  -  0x0  -  0x100008148  -
    //                                        存在        -   不存在 - 不存在 - 存在
}










void lgClassMethod_classToMetaclass(Class pClass){
    
    const char *className = class_getName(pClass);
    Class metaClass = objc_getMetaClass(className);
    
    Method method1 = class_getClassMethod(pClass, @selector(sayHello));
    Method method2 = class_getClassMethod(metaClass, @selector(sayHello));

    Method method3 = class_getClassMethod(pClass, @selector(sayHappy));
    // 元类 为什么有 sayHappy 类方法 0 1
    //
    Method method4 = class_getClassMethod(metaClass, @selector(sayHappy));
    
    LGLog(@"%s  -  %p  -  %p  -  %p  -  %p  -  ",__func__,method1,method2,method3,method4);
    //
    //  存在
}






//  换一种角度


//  查询类与  meta 元类的， 方法信息


void sixIMP_classToMetaclass(Class pClass){
    
    const char *className = class_getName(pClass);
    Class metaClass = objc_getMetaClass(className);

    // - (void)sayHello;
    // + (void)sayHappy;
    IMP imp1 = class_getMethodImplementation(pClass, @selector(sayHello));
    IMP imp2 = class_getMethodImplementation(metaClass, @selector(sayHello));

    IMP imp3 = class_getMethodImplementation(pClass, @selector(sayHappy));
    IMP imp4 = class_getMethodImplementation(metaClass, @selector(sayHappy));

    LGLog(@"%s  -  %p  -  %p  -  %p  -  %p  -  ",__func__, imp1, imp2, imp3, imp4);
    //  sixIMP_classToMetaclass  -  0x100003d10  -  0x7fff2033c5c0  -  0x7fff2033c5c0  -  0x100003d40  -
    
 
    // 0x7fff2033c5c0, 这个好像是， 转发指针
}







int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 0x0000000100000000
        // LGTeacher *teacher = [LGTeacher alloc];

        LGPerson *person = [LGPerson alloc];
        Class pClass     = object_getClass(person);
        lgObjc_copyMethodList(pClass);

        
        ////      br
        NSLog(@" - - \n\n - -");
        
        
        
        
        instanceMethod_classToMetaclassXx(pClass);
        
        NSLog(@" - - \n\n - -");
        
        ////      br
        sixIMP_classToMetaclass(pClass);
        
        
        NSLog(@" - - \n\n - -");
        
        ////      br
        
        
        lgClassMethod_classToMetaclass(pClass);
        
    }
    return 0;
}
