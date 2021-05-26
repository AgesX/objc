
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
        
        //  NSObject，系统做完的
        
        Soilder *k = [Soilder alloc];
        
        
        // 走方法，先查找 SEL - IMP ( SEL 对应 IMP 的关系 )
        
        
        // 此时，寻找 SEL : alloc,
        // 为什么会找到 objc_alloc 的 IMP
        
        
        // 系统做了些什么？
        
        // LLVM ， 编译启动时，确定的
        
        // LLVM  对 alloc 的特殊修饰，
        // 调用 alloc， 即调用 objc_alloc
        
        
        
        // 进入 objc_alloc 后，
        // 发消息， objcMsg_send  (  objc_alloc + alloc  )
        
        k.weapon = @"  fire ";
        k.shield = @"  poison ";

        
        

    }
    return 0;
}




















