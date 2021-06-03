//
//  Bicycle.h
//  003-联合体位域
//
//  Created by cooci on 2020/9/7.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bicycle : NSObject



/*
@property (nonatomic, assign) BOOL front;
@property (nonatomic, assign) BOOL back;
@property (nonatomic, assign) BOOL left;
@property (nonatomic, assign) BOOL right;

 
 
 
 */
 
 
// 对象 - 属性
// 4*4 = 16字节*8位 = 128位 浪费

- (void)setFront:(BOOL)isFront;  // 存储 : 1字节 = 8位 0000 1111  char + 位域  bit 结构体
- (BOOL)isFront;

- (void)setBack:(BOOL)isBack;
- (BOOL)isBack;


+ (void) fly;
@end

NS_ASSUME_NONNULL_END
