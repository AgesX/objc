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
    
    
    //  Thread 1: EXC_BAD_ACCESS (code=2, address=0x7ffee14f9ff8)
    
    
    //  进入了，死循环
    
    
    
    
    
    
    
    
    
    // personInstanceMethod -> lg_studentInstanceMethod
    LGPerson *p = [[LGPerson alloc] init];
    // [p personInstanceMethod];
    
    
    
    
    
    
    
    
    
    
    
}


@end
