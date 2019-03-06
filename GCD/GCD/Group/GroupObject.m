//
//  GroupObject.m
//  GCD
//
//  Created by chengfei on 2019/3/6.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "GroupObject.h"

@interface GroupObject () {
    dispatch_queue_t concurrent_queue;
    NSMutableArray <NSURL *> *arrayURLs;
}

@end

@implementation GroupObject

- (id)init {
    self = [super init];
    if (self) {
        concurrent_queue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
        arrayURLs = [NSMutableArray array];
    }
    return self;
}

- (void)handle {
    dispatch_group_t group = dispatch_group_create();
    
    //遍历各个元素执行操作
    for (NSURL *url in arrayURLs) {
        dispatch_group_async(group, concurrent_queue, ^{
//            根据url去下载
            NSLog(@"url is %@", url);
        });
    }
    
    dispatch_group_notify(group, concurrent_queue, ^{
//        当添加到组中的所有任务执行完成之后会调用这个Block
        NSLog(@"所有图片已经下载完成");
    });
}

@end
