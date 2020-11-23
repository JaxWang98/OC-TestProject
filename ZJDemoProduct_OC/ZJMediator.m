//
//  ZJMediator.m
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/11/23.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJMediator.h"

@implementation ZJMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl { 
    Class detailCls = NSClassFromString(@"ZJNewsDetailViewController");
    UIViewController *vc = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithURL:") withObject:detailUrl];
    return vc;
}

@end
