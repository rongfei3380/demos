//
//  IndexedTableView.h
//  viewReusePool
//
//  Created by chengfei on 2019/2/28.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexedTablewViewDataSource <NSObject>

/**
 获取一个tabview的字母索引条数据的方法

 @param tableView 索引条的关联的tableView
 @return 数据
 */
- (NSArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView;

@end

@interface IndexedTableView : UITableView

@property(nonatomic, weak)id<IndexedTablewViewDataSource> indexedDataSource;

@end

NS_ASSUME_NONNULL_END
