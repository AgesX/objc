
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
        Soilder *k = [Soilder alloc];
        
        
        k.weapon = @"  fire ";
        
        
        k.shield = @"  poison ";
        
        NSLog(@"  %@  ", k);
        
        
        
        

    }
    return 0;
}




















// x/4gx
