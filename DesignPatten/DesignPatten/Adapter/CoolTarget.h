//
//  CoolTarget.h
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target.h"

NS_ASSUME_NONNULL_BEGIN

/**
 适配对象
 */
@interface CoolTarget : NSObject

// 被适配对象
@property(nonatomic, strong) Target *target;
// 对原有方法包装
- (void)request;

@end

NS_ASSUME_NONNULL_END
