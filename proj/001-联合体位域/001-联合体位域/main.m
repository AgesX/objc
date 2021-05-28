//
//  main.m
//  001-联合体位域
//
//  Created by cooci on 2020/9/8.
//  Copyright © 2020 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import "LGCar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        LGCar *car = [[LGCar alloc] init];
        
        NSLog(@"isBack:             %@", [car isBack]  ? @"TRUE": @"FALSE");
        
        
        
        car.front  = 1;
        car.back   = 0;
//        car.left   = 0;
//        car.right  = 1;
        
        car.front = YES;
        car.back  = YES;
        
        NSLog(@"isBack   now :             %@", [car isBack]  ? @"TRUE": @"FALSE");
    }
    return 0;
}
