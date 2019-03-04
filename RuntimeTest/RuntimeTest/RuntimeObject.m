//
//  RuntimeObject.m
//  RuntimeTest
//
//  Created by chengfei on 2019/3/2.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "RuntimeObject.h"
#import <objc/runtime.h>

@implementation RuntimeObject

+ (void)load {
    // 获取test方法
    Method test = class_getInstanceMethod(self, @selector(test));
    // 获取otherTest方法
    Method otherTest = class_getInstanceMethod(self, @selector(otherTest));
//    交换两个方法的实现
    method_exchangeImplementations(test, otherTest);
}


- (void)test {
    NSLog(@"test");
}

- (void)otherTest {
    [self otherTest];  // 是否会产生死循环？？  其实这里 实际上是 objc_msgSend(self , @slecter(otherTest)), 查找方法，load之后已经进行了交换，实际上调用的是test方法
    NSLog(@"otherTest");
}

// 查找不到 具体实现才会 执行以下方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    如果是test方法 打印日志
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod");
        return NO;
    } else {
//        返回父类没人调用
        return [super resolveInstanceMethod:sel];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector:");
        return [NSMethodSignature signatureWithObjCTypes:"V@:"];
    } else {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}

@end
