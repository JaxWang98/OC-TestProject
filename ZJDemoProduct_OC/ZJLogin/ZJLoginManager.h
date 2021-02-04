//
//  ZJLoginManager.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2021/2/4.
//  Copyright © 2021 widerness. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJLoginManager : NSObject


#pragma mark -- 登录
- (BOOL)isLogin;
- (void)loginSuccess:(void(^)(BOOL isLogin))successBlock;
- (void)logOut;

#pragma mark -- 分享
- (void)shareToQQWithArticleUrl:(NSURL *)articleURL;

@end

NS_ASSUME_NONNULL_END
