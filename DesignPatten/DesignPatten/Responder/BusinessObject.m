//
//  BusinessObject.m
//  DesignPatten
//
//  Created by chengfei on 2019/3/10.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "BusinessObject.h"

@implementation BusinessObject

//责任链入口方法
- (void)handle:(ResultBlock)result {
    CompletionBlock completion = ^(BOOL handled) {
//        如果业务处理掉了，上抛结果
        if (handled) {
            result(self, handled);
        } else {
//            沿着责任链，指派给下一个业务处理
            if (self.nextBusiness) {
                [self.nextBusiness handle:result];
            } else {
//                没有业务处理，上抛
                result(nil, NO);
            }
        }
    };
    [self handleBusiness:completion];
}

- (void)handleBusiness:(CompletionBlock)completion {
    /**
     业务逻辑处理
     如网络请求、本地照片查询等
     */
//    if (1) {
        NSLog(@"%@ 处理任务", self);
//        completion(YES);
//    } else {
//        completion(NO);
//    }
}

@end
