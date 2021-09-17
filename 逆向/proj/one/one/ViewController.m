//
//  ViewController.m
//  one
//
//  Created by Jz D on 2021/9/16.
//

#import "ViewController.h"

@interface ViewController ()

@end




int test(void){
    
    int temp = 0x1FFFFFFFF;
    
    
    return temp;

}







@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    printf("%x\n", test());
    
    
    
    
}


@end
