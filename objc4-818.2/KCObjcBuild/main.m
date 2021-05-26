
#import <Foundation/Foundation.h>



@interface Soilder : NSObject


@property (nonatomic, assign) double kind;


@property (nonatomic, assign) double ally;

@property (nonatomic, strong) NSString * weapon;


@property (nonatomic, strong) NSString * shield;




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
        
        
        k.shield = @"  poison ";
        
        NSLog(@"  %@  ", k);
        
        
        
        

    }
    return 0;
}















// 对象在底层， 编译为结构体










// x/4gx， 打印 4 条


// x/8gx， 打印 8 条



// 内存对齐，内存的优化重排
