
#import <Foundation/Foundation.h>



struct Soilder{
    double one;  // 8 ( 0 - 7 )
    char two;   // 1  ( 8  1 ) 8
    int three;  // 4  ( 9  4 ) 9   10    11   12
    // 需要调整
    // 初始位置，必须是其大小的整数倍
    // 调整后
    // 12    13     14       15
    
    
    
    short four;   // 2       ( 16  2 ） 16    17
}Soilder;





// 结构体指针的，内存大小
// size 8







// 结构体的内存大小，

// 根据其内部的大小，进行开辟



// 15 -> 对齐为，  16 字节. hehe

// 调整后， 为 24 个字节

struct Warrior{
    double a;   // 8   ( 0 - 7 )
    int b;    // 4   （ 8   4） 8 - 11
    char c;   // 1   （12 1 )
    short d;   // 2   (13  2 )  13 14 -> 调整后 14  15
}Warrior;

// 结构体指针
// size 8 个字节



// 结构体的内存大小，根据他的属性来

// 15 -> 对齐为，  16 字节. 呵呵， 不是

// 调整后， 为 16 个字节









// 内存对齐，方便读取,



// 建立规则，读取不容易出错,
// 读取，更加安全


// 这样不会，读到其他属性的部分









// 对齐的原则:

// 1， 找出最大的属性

// 当前 8

// 2， 如果结构体中，还含有结构体


// 如果结构体，嵌套结构体
// 结构体的大小，基于结构体内部的所有属性之和








// 内存对齐，
// 苹果做了重排，避免内存的浪费

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        Soilder * k = [[Soilder alloc] init];

        NSLog(@"Soilder: %lu  ->   \n\n Warrior:   %lu", sizeof(Soilder), sizeof(Warrior));
        

    }
    return 0;
}















// 对象在底层， 编译为结构体










// x/4gx， 打印 4 条


// x/8gx， 打印 8 条


// 第 4 行，第一列， 是什么值
// 有可能，不是这个对象的值了
// 因为内存的连续性， 打印到别人家的了






// 内存对齐，内存的优化重排











// 怎样把指针，和类关联?
// isa , 是怎么指向的？




