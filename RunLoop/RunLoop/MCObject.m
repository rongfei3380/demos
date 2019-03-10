//
//  MCObject.m
//  RunLoop
//
//  Created by chengfei on 2019/3/8.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "MCObject.h"

@implementation MCObject

static NSThread *thread = nil;
//标记是否要继续循环事件循环
static BOOL runAlways = YES;

+ (NSThread *)threadForDispatch {
    if (thread == nil) {
        @synchronized (self) {
            if (thread == nil) {
//                线程创建
                thread = [[NSThread alloc] initWithTarget:self selector:@selector(runAlways) object:nil];
                [thread setName:@"com.imooc.thread"];
//                线程启动
                [thread start];
            }
        }
    }
    return thread;
}

- (void)runAlways {
//    第一种方式添加Source
    [MCObject runRequest];
//    第二种方式 添加port
    [MCObject runWithPort];
//    第三种方式 添加 timer
    [MCObject runWithTimer];
}


+ (void)runRequest {
//    创建一个Source
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    
//    创建RunLoop，同时向runloop的DefaultMode中添加Source
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    
//    如果可以运行  每次运行循环可以清除内存
    while (runAlways) {
        @autoreleasepool {
//            令当前RunLoop运行在DefaultMode下面
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
        }
    }
    
//    某一时机，静态变量runalways = NO 时 可以保证跳出RunLoop 线程退出
    CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    CFRelease(source);
}

+ (void)runWithPort {
//    添加port实时监听
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//    添加runLoop
    [[NSRunLoop currentRunLoop] run];
}

- (void)timerForAlways {
    
}

+ (void)runWithTimer {
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerForAlways) userInfo:nil repeats:YES];
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    [runloop run];
}


@end
