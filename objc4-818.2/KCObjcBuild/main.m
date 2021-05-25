//
//  main.m
//  KCObjcBuild
//
//  Created by cooci on 2021/1/5.


// KC 重磅提示 调试工程很重要 源码直观就是爽
// ⚠️编译调试不能过: 请你检查以下几小点⚠️




// ①: enable hardened runtime -> NO
// ②: build phase -> denpendenice -> objc


#import <Foundation/Foundation.h>



@interface Soilder : NSObject

@end



@implementation Soilder



@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n\n");
        
        
        // alloc , 开辟内存，有了一个指针地址
        
        
        
        // init，构造方法，
        // 设计模式中的，工厂模式
        
        // 这样开发，可以继承 init 方法，做一些自定义的操作 / 重写
        
        // 例子: array 和 objc ，初始化出来，带的东西相同
        
        
        
        
        Soilder *objc = [[Soilder alloc] init];
        NSLog(@"111:  %@\n\n", objc);
        
        
        
    }
    return 0;
}




