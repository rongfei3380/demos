//
//  Command.m
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "Command.h"
#import "CommandManager.h"

@implementation Command

- (void)execute {
    // override to subclass
    [self done];
}

- (void)cancel {
    self.completion = nil;
}

- (void)done {
//    这里做一些业务处理
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self->_completion) {
            self->_completion(self);
        }
        self.completion = Nil;
        
    });
}

@end
