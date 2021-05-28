//
//  LGCar.m
//  003-联合体位域
//
//  Created by cooci on 2020/9/7.
//  Copyright © 2020 cooci. All rights reserved.
//

#import "LGCar.h"

#define LGDirectionFrontMask    (1 << 0)
#define LGDirectionBackMask     (1 << 1)
#define LGDirectionLeftMask     (1 << 2)
#define LGDirectionRightMask    (1 << 3)

// ISA 8字节 64 信息 性能
// 2^64

@interface LGCar(){
    // 联合体
    union {
        char bits;
        // 位域
        struct { // 0000 1111
            char front  : 1;
            char back   : 1;
            char left   : 1;
            char right  : 1;
        };
    } _direction;
}
@end


@implementation LGCar

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

@end
