//
//  Command.h
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Command;
typedef void(^CommandCompletionCallBack)(Command *cmd);

@interface Command : NSObject
@property(nonatomic, copy)CommandCompletionCallBack __nullable completion;

- (void)execute;
- (void)cancel;

- (void)done;
@end

NS_ASSUME_NONNULL_END
