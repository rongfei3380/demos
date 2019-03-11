//
//  Single.h
//  DesignPatten
//
//  Created by chengfei on 2019/3/11.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Single : NSObject<NSCopying>

+ (id)sharedInstance;

@end

NS_ASSUME_NONNULL_END
