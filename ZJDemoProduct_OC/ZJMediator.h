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

@interface ZJMediator : NSObject

//target-action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

NS_ASSUME_NONNULL_END
