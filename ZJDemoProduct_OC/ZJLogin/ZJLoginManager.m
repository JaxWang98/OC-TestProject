//
//  ZJLoginManager.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2021/2/4.
//  Copyright © 2021 widerness. All rights reserved.
//

#import "ZJLoginManager.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface ZJLoginManager()
@property (nonatomic, strong) TencentOAuth *oauth;
@property (nonatomic, assign) BOOL isLogin;
@end

@implementation ZJLoginManager

+ (instancetype)sharedLoginManager {
    
    static ZJLoginManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZJLoginManager alloc] init];
    });
    return manager;
}

- (BOOL)isLogin {
    return _isLogin;
}
- (void)loginSuccess:(void (^)(BOOL))successBlock {
    
}

- (void)logOut {
    
}

@end
