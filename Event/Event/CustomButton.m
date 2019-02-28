//
//  CustomButton.m
//  Event
//
//  Created by chengfei on 2019/2/28.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;  // 返回nil 表明此button不响应
    }
    
    if ([self pointInside:point withEvent:event]) {
//        遍历当前z对象的子视图
        __block UIView *hit = nil;
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            // 坐标转换 到目标视图
            CGPoint vonvertPoint = [self convertPoint:point toView:obj];
//            调用子视图的hitTest方法
            hit = [obj hitTest:vonvertPoint withEvent:event];
//            如果找到了接受事件的对象 则停止遍历
            if (hit) {
                *stop = YES;
            }
        }];
        
        if (hit) {
            return hit;
        }else {
            return self;
        }
    }else {
        return nil;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
//    计算圆心
    CGFloat x2 = self.frame.size.width/2;
    CGFloat y2 = self.frame.size.height/2;
    
//    计算触摸点 到圆心的距离
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2)*(y1 - y2));
    
    //触摸点 是否在button的内接圆中
    if (dis <= self.frame.size.width /2) {
        return true;
    } else {
        return false;
    }
}

@end
