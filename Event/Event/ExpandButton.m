//
//  ExpandButton.m
//  Event
//
//  Created by chengfei on 2019/2/28.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "ExpandButton.h"

@implementation ExpandButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect bounds =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    //宽高希望扩展的范围
    CGFloat widthDelta = 30;
    CGFloat heightDelta = 20;
    
    //相当于bounds 上下左右都增加了10的额外
    bounds =CGRectInset(bounds, -widthDelta, -heightDelta);//注意这里是负数，扩大了之前的bounds的范围
    
    //点击的点是否在这个范围
    return CGRectContainsPoint(bounds, point);
}


@end
