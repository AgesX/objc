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





// 可以有


// 把类里面的对象方法，都找出来
void classCopyMethodList(Class pClass){
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







// 此路不通

// 把  meta 元类  ，  里面的对象方法，都找出来
void metaCopyMethodList(Class pClass){
    
    const char *className = class_getName(pClass);
    Class metaClass = objc_getMetaClass(className);
    
    
    unsigned int count = 0;
    Method *methods = class_copyMethodList(metaClass, &count);
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










void riClassMethod_classToMetaclass(Class pClass){
    
    const char *className = class_getName(pClass);
    Class metaClass = objc_getMetaClass(className);
    
    Method method1 = class_getClassMethod(pClass, @selector(sayHello));
    Method method2 = class_getClassMethod(metaClass, @selector(sayHello));

    Method method3 = class_getClassMethod(pClass, @selector(sayHappy));
    // 元类 为什么有 sayHappy 类方法
    
    
    
    //  元类，如果继续走下去，就会指向自个
    
    
    //  来避免无限的递归
    
    
    
    //  判断，如果是元类，就不会再递归下去了
    Method method4 = class_getClassMethod(metaClass, @selector(sayHappy));
    
    LGLog(@"%s  -  %p  -  %p  -  %p  -  %p  -  ",__func__,method1,method2,method3,method4);
    //     riClassMethod_classToMetaclass  -  0x0  -  0x0  -  0x100008148  -  0x100008148  -
    
    //                                        不存在 - 不存在 -     存在      -      存在
    //     类和 meta 元类，都含有类方法
    //     meta 元类，同时含有该类方法， 作为实例方法
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
    
    
    
    
    // 0x100003d10 和 0x100003d40
    // IMP 指针，实现指针
    
    
    
    // 0x7fff2033c5c0, 这个好像是， 转发指针
    // 方法不存在，就走转发
    
    
    
    
    
/*
 
 
 
 
 
 
 (lldb) p imp1
 (IMP) $0 = 0x0000000100003d10 (002-类方法归属分析`-[LGPerson sayHello] at LGPerson.m:13)
 
 (lldb) p imp2
 (IMP) $1 = 0x00007fff202d65c0 (libobjc.A.dylib`_objc_msgForward)
 
 (lldb) p imp3
 (IMP) $2 = 0x00007fff202d65c0 (libobjc.A.dylib`_objc_msgForward)
 
 (lldb) p imp4
 (IMP) $3 = 0x0000000100003d40 (002-类方法归属分析`+[LGPerson sayHappy] at LGPerson.m:17)
 
 
 
 
 */
}










int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 0x0000000100000000
        // LGTeacher *teacher = [LGTeacher alloc];

        LGPerson *person = [LGPerson alloc];
        
        Class pClass     = object_getClass(person);
        
        
        metaCopyMethodList(pClass);
        
        
        ////      br
        NSLog(@" - - \n\n - -");
        
        
        classCopyMethodList(pClass);

        
        ////      br
        NSLog(@" - - \n\n - -");
        
        
        
        
        instanceMethod_classToMetaclassXx(pClass);
        
        NSLog(@" - - \n\n - -");
        
        ////      br
        sixIMP_classToMetaclass(pClass);
        
        
        NSLog(@" - - \n\n - -");
        
        ////      br
        
        
        riClassMethod_classToMetaclass(pClass);
        
    }
    return 0;
}
