//
//  Gladiator.h
//  002-系统内存开辟分析
//
//  Created by cooci on 2020/9/5.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Gladiator : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) long height;

@end

NS_ASSUME_NONNULL_END
