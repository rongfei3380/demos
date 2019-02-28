//
//  IndexedTableView.m
//  viewReusePool
//
//  Created by chengfei on 2019/2/28.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "IndexedTableView.h"
#import "ViewReusePool.h"

@interface IndexedTableView (){
    UIView *containerView;
    ViewReusePool *reusePool;
}

@end

@implementation IndexedTableView

- (void)reloadData {
    [super reloadData];
    if (containerView == nil) {
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor blueColor];
//        可避免 索引条随着tableview滚动
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    
    if (reusePool == nil) {
        reusePool = [[ViewReusePool alloc] init];
    }
    // 标记所有视图为 可重用状态
    [reusePool reset];
    
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar {
    NSArray <NSString *> *arrayTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        arrayTitles = [self.indexedDataSource indexTitlesForIndexTableView:self];
    }
    
    if (!arrayTitles || arrayTitles.count <= 0) {
        [containerView setHidden:YES];
        return;
    }
    
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height /count;
    
    for (int i = 0; i < arrayTitles.count; i++) {
//        重用池 取出一个 button
        UIButton *button = (UIButton *)[reusePool dequeueReusebleView];
        if (button == nil) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor whiteColor];
            [reusePool addUsingView:button];
            NSLog(@"新建button 添加到重用池中");
        } else {
            NSLog(@"使用重用池中的button");
        }
        
        [containerView addSubview:button];
        NSString *title = [arrayTitles objectAtIndex:i];
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(0, i*buttonHeight, buttonWidth, buttonHeight);
    }
    containerView.hidden = NO;
    containerView.frame = CGRectMake(self.frame.origin.x +self.frame.size.width -buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
    
}


@end
