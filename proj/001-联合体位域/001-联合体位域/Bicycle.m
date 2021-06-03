//
//  Bicycle.m
//  003-联合体位域
//
//  Created by cooci on 2020/9/7.
//  Copyright © 2020 cooci. All rights reserved.
//

#import "Bicycle.h"

#define LGDirectionFrontMask    (1 << 0)
#define LGDirectionBackMask     (1 << 1)
#define LGDirectionLeftMask     (1 << 2)
#define LGDirectionRightMask    (1 << 3)

// ISA 8字节 64 位

// 当前对象的地址

// 信息 性能
// 2^64













@interface Bicycle(){
    // 联合体
    union {
        char bits;
        // 位域
        struct {
            // 0000 1111
            
            
            
            // 结构体，是从前，排到后的
            
            
            
            char front  : 1;        //  1，    代表他们，占用的大小
            // 0001
            
            
            
            
            char back   : 1;
            // 0010
            
            
            // 如果  back   : 2;
            // 代表两个位置
            // 0110
            
            
            
            
            char left   : 1;
            //   0100
            
            
            
            char right  : 1;
            //   1000
            //   1 不代表 值，
            //   只是代表，占用的位置
            
        };
    } _direction;
    
    
    //  联合体   _direction，  有一个属性 bits ，
    //  bits 的每个位置，代表里面的匿名结构体 ( 4 个 char 成员变量  )
}
@end







































@implementation Bicycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        _direction.bits = 0b0000000000;
    }
    return self;
}

- (void)setFront:(BOOL)isFront {
        
    if (isFront) {
        _direction.bits |= LGDirectionFrontMask;
    } else {
        _direction.bits |= ~LGDirectionFrontMask;
    }
    NSLog(@"%s",__func__);
}

- (BOOL)isFront{
    return _direction.front;
}





- (void)setBack:(BOOL)isBack {
    
    
    // 化 4 个字节，为 1 个字节
    NSLog(@"%@ - %lu - \n\n\n", self, sizeof(_direction));
    
    
    
    _direction.back = isBack;

    NSLog(@"%s",__func__);
}

- (BOOL)isBack{
    return _direction.back;
}



+ (void) fly{
    
    
    
}

@end
