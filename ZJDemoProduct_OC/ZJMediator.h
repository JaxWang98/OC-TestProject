//
//  ZJMediator.h
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/11/23.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//中间件类，使用三种常见的组件化方案实现代码解耦
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZJNewsDetailViewControllerProtocol <NSObject>

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end


@interface ZJMediator : NSObject

//target-action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlScheme
typedef void(^ZJMediatorProcessBlock)(NSDictionary *params);

/// 注册scheme,写入注册表
/// @param scheme 字典的key
/// @param processBlock 具体的逻辑代码
+ (void)registerScheme:(NSString *)scheme processBlock:(ZJMediatorProcessBlock)processBlock;


/// 执行url对应的scheme
/// @param url scheme对应的url
/// @param params 方法需要的参数
+ (void)openURL:(NSString *)url params:(NSDictionary *)params;

//protol class
+ (void)registerProtocol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
