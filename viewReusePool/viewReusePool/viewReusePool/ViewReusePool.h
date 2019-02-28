//
//  ViewReusePool.h
//  viewReusePool
//
//  Created by chengfei on 2019/2/28.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 实现重用机制的类
 */
@interface ViewReusePool : NSObject


/**
 从重用池中取出一个可重用的view
 @return 重用的view
 */
- (UIView *)dequeueReusebleView;

/**
 向重用池中添加一个视图

 @param view 需要重用的view
 */
- (void)addUsingView:(nullable UIView *)view;

/**
 重置方法 将当前使用中的视图移动到可重用队列中
 */
- (void)reset;


@end

NS_ASSUME_NONNULL_END
