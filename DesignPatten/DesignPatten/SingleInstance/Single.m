//
//  Single.m
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "Single.h"

@implementation Single

+ (id)sharedInstance {
//    静态局部变量
    static Single *instance = nil;
//    通过dispatch_once方式 确保instance 在多线程环境下 只被创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        在调用alloc的时候，默认的alloc会调用allocWithZone方法
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 重写方法 必不可少  避免通过其他的方法 生成新的对象
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

// 重写方法 必不可少
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
@end
