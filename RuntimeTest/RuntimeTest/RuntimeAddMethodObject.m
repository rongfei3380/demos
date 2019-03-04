//
//  RuntimeAddMethodObject.m
//  RuntimeTest
//
//  Created by chengfei on 2019/3/2.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "RuntimeAddMethodObject.h"
#import <objc/runtime.h>

@implementation RuntimeAddMethodObject

void testImp (void) {
    NSLog(@"test invoke");
}


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //    如果是test方法 打印日志
    if (sel == @selector(testAddMethod)) {
        NSLog(@"resolveInstanceMethod");
        
        class_addMethod(self, @selector(testAddMethod), testImp, "v@:");
        
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
    if (aSelector == @selector(testAddMethod)) {
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
