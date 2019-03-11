//
//  BaseObjectA.m
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "BaseObjectA.h"

@implementation BaseObjectA


/**
 A1 --> B1, B2, B3
 A2 --> B1, B2, B3
 A3 --> B1, B2, B3
 */
- (void)handle {
//    override to subclass
    [self.objB fetchData];
}

@end
