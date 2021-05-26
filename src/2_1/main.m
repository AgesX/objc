
#import <Foundation/Foundation.h>



@interface Soilder : NSObject


@property (nonatomic, assign) int kind;


@property (nonatomic, assign) long ally;

@property (nonatomic, strong) NSString * weapon;


@property (nonatomic, strong) NSString * shield;


@property (nonatomic, assign) char come;


@property (nonatomic, assign) char go;


@end



@implementation Soilder



@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 内存对齐
        
        
        // 对象的内存对齐，
        // 源自于
        // 结构体的内存对齐
        
        
        
        
        Soilder *k = [Soilder alloc];
        
        
        k.weapon = @"  fire ";
        
        
        k.shield = @"  poison ";  // 64 位下， 占用内存， 8 个字节
        
        
        
        k.kind = 5;    // 64 位下， 占用内存， 4 个字节
        k.come = 'A';  // 占用内存， 1 个字节
        k.go = 'E';    // 占用内存， 1 个字节
        
        
        
        NSLog(@"  %@  ", k);
        
        
        
        

    }
    return 0;
}















// 对象在底层， 编译为结构体










// x/4gx， 打印 4 条


// x/8gx， 打印 8 条



// 内存对齐，内存的优化重排
