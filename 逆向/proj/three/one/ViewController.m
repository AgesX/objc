//
//  ViewController.m
//  one
//
//  Created by Jz D on 2021/9/16.
//

#import "ViewController.h"

@interface ViewController ()

@end


// 调用汇编

// 函数的声明
int A();
int B();


int test(void){
    
    int temp = 0x1FFFFFFFF;
    
    
    return temp;

}


void D(void){
}

void C(void){
    D();
    return;
}




@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    C();
    
    
    
    printf("开始 \n");
    
    
    A();        // OC 调用汇编
    
    
    printf("结束 \n");
    
}


@end




