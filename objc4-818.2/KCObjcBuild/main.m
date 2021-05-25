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
        Soilder *objc = [[Soilder alloc] init];
        NSLog(@"111:  %@\n\n", objc);
        
        
        
    }
    return 0;
}
