
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
        
        
        
        
        

        Soilder *k = [Soilder alloc];
        
        
        k.weapon = @"  fire ";
        k.shield = @"  poison ";

        
        

    }
    return 0;
}













