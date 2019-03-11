//
//  CommandManager.h
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommandManager : NSObject<NSCopying>
// 命令管理容器
@property(nonatomic, strong)NSMutableArray<Command *> *arrayCommands;

//命令管理者以单例方式呈现
+ (instancetype)sharedInstance;

//执行命令
+ (void)executeCommand:(Command *)cmd completion:(CommandCompletionCallBack)completion;

//取消命令
+ (void)cancelCommand:(Command *)cmd;

@end

NS_ASSUME_NONNULL_END
