//
//  BusinessObject.h
//  DesignPatten
//
//  Created by chengfei on 2019/3/10.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BusinessObject;
typedef void (^CompletionBlock)(BOOL handled);
typedef void (^ResultBlock)(BusinessObject *__nullable handler, BOOL handled);

@interface BusinessObject : NSObject

//下一个响应者（响应链构成的关键）
@property(nonatomic, strong) BusinessObject *nextBusiness;
// 响应者的处理方法
- (void)handle:(ResultBlock)result;
// 各个业务在该方法当中做实际业务处理
- (void)handleBusiness:(CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
