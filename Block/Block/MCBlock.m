//
//  MCBlock.m
//  Block
//
//  Created by chengfei on 2019/3/4.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "MCBlock.h"

@implementation MCBlock

// 全局变量
int global_var = 4;
//静态全局变量
static int static_global_var = 5;

- (void)method {
    int multiplier = 6;
    int(^Block)(int) = ^int(int num) {
        return num * multiplier;
    };
    Block(2);
}

- (void)testAllTypes {
//    基本数据类型的局部变量
    int var = 1;
//    对象类型的局部变量
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    
//    局部静态变量
    static int static_var = 3;
    
    void(^block)(void) = ^{
        NSLog(@"局部变量<基本数据类型> var %d", var);
        
        NSLog(@"局部变量<__unsafe_unretained 对象类型> var %@", unsafe_obj);
        NSLog(@"局部变量<__strong 对象类型> var %@", strong_obj);
        
        NSLog(@"静态变量 %d", static_var);
        
        NSLog(@"全局变量 %d", global_var);
        NSLog(@"静态全局变量 %d", static_global_var);
    };
    
    block();
    
}

@end
