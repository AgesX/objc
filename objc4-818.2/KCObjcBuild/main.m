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


// 因为内存对齐
// 字节对齐




// 对于对象
// 影响内存对齐的因素，
// 是属性



// 加一个属性 , 16
@property (nonatomic, strong) NSString * weapon;


// 加 2 个属性 , 32
// 32 = ( 8 + 8 + 8 ) , 来一个 16 字节对齐


@property (nonatomic, strong) NSString * shield;




// 内存的布局: 属性

@end



@implementation Soilder



@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n\n");
        
        
        // alloc , 开辟内存，有了一个指针地址
        
        
        

        
        
        
        
        // 调用 alloc 方法，产生一个 16 字节的内存
        // 对象指针
        Soilder *k = [Soilder alloc];
        
        
        // init，构造方法，
        // 设计模式中的，工厂模式
        
        // 这样开发，可以继承 init 方法，做一些自定义的操作 / 重写
        
        // 例子: array 和 objc ，初始化出来，带的东西相同
        
        
        
        
        
        
        // 通常 custom class,
        // 都会 init 重写一些，
        // 带一些自定制的东西
        Soilder *objc = [[Soilder alloc] init];
        NSLog(@"111:  %@\n\n", objc);
        
        
        
        
        
        
        
        
        
        
        
        
        // new 方法，一般情况下，等同于 alloc, init
        // 但是失去了，我们自定制的 init 的部分
        
        
        // new 方法，不一定合适
        Soilder *win = [Soilder new];
    }
    return 0;
}














