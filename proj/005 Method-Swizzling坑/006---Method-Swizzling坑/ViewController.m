//
//  ViewController.m
//  006---Method-Swizzling坑
//
//  Created by cooci on 2019/2/16.
//  Copyright © 2019 cooci. All rights reserved.
//

#import "ViewController.h"
#import "LGPerson.h"
#import "LGStudent.h"
#import "LGStudent+LG.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 黑魔法坑点二: 子类没有实现 - 父类实现
    LGStudent *s = [[LGStudent alloc] init];
    [s personInstanceMethod];
    

    
    
    
    NSLog(@"---\n\n\n----");
    
    
    
    // personInstanceMethod -> lg_studentInstanceMethod
    LGPerson *p = [[LGPerson alloc] init];
    [p personInstanceMethod];
    
    
    
    
    
    /*
     
            2021-08-07 07:46:01.789847+0800 006---Method-Swizzling坑[1862:114338] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[LGPerson lg_studentInstanceMethod]: unrecognized selector sent to instance 0x6000035fc730'
     
     
     */
    
    
    
    
    
}


@end
