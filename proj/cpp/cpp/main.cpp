//
//  main.cpp
//  cpp
//
//  Created by Jz D on 2021/8/1.
//

#include <iostream>


using namespace std;


struct Mercy{
    Mercy(){
        printf("来， 初始化");
        
    }
    
    
    
    
    
    ~Mercy(){
        printf("来， 进行释放");
    }
    
};




int main(int argc, const char * argv[]) {
    // insert code here...
    
    
    Mercy test;
    
    
    cout << endl;
    
    return 0;
}
