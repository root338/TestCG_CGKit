//
//  MLTestDispatch.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLTestDispatch.h"

@implementation MLTestDispatch


- (void)testSerialQueue
{
    NSLog(@"测试 ------ 串行队列 --------");
    dispatch_queue_t serialQueue = dispatch_queue_create("com.ml.test.serial.queue", NULL);
    dispatch_async(serialQueue, ^{
        NSLog(@"异步 dispatch_async 第一个 block");
    });
    dispatch_async(serialQueue, ^{
        sleep(2);
        NSLog(@"异步 dispatch_async 第二个 block，但是我先睡了 2 秒");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"异步 dispatch_async 第三个 block");
    });
}

- (void)testConcurrentQueue
{
    NSLog(@"======== 测试并发队列 ==========");
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.ml.test.concurrent.queue", NULL);
    dispatch_async(concurrentQueue, ^{
        NSLog(@"异步 dispatch_async 第一个 block");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"异步 dispatch_async 第一个 block，但是我先睡了 2 秒");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"异步 dispatch_async 第三个 block");
    });
}

@end
