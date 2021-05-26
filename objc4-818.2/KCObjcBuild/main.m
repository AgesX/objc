
#import <Foundation/Foundation.h>



@interface Soilder : NSObject



@property (nonatomic, strong) NSString * weapon;


@property (nonatomic, strong) NSString * shield;



@end



@implementation Soilder



@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // 没有走     _objc_rootAlloc
        // 的断点
        NSObject * me = [NSObject alloc];
        
        // 走的是
        
        
        // id     objc_alloc(Class cls)
        
        
        
        
        
        
        
        
        
        
        
        
        //  NSObject , 和 Soilder 的区别是
        //  Soilder 有一个重写
        
        
        // NSObject 是根类，
        // 所以 NSObject , 和 Soilder 走的 alloc 方法
        // 不一致
        
        
        // alloc 探讨，汇编点一下
        
        
        //  alloc -> objc_alloc
        //  Soilder 会走了两次 alloc
        
        
        //  先走 objc_alloc， 再走 alloc
        
        
        Soilder *k = [Soilder alloc];
        
        
        k.weapon = @"  fire ";
        k.shield = @"  poison ";

        
        

    }
    return 0;
}

















