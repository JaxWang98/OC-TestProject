//
//  ZJMediator.m
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/11/23.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJMediator.h"

@implementation ZJMediator

#pragma mark -- 注册表

/// mediator的注册表,  单例形式存储
+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

#pragma mark -- 组件化方法

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl { 
    Class detailCls = NSClassFromString(@"ZJNewsDetailViewController");
    UIViewController *vc = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithURL:") withObject:detailUrl];
    return vc;
}


+ (void)registerScheme:(NSString *)scheme processBlock:(ZJMediatorProcessBlock)processBlock {
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void)openURL:(NSString *)url params:(NSDictionary *)params {
    ZJMediatorProcessBlock processBlock = [[[self class] mediatorCache] objectForKey:url];
    if (processBlock) {
        processBlock(params);
    }
}


+ (void)registerProtocol:(Protocol *)proto class:(Class)cls {
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}

+ (Class)classForProtocol:(Protocol *)proto {
    return  [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];;
}



@end
