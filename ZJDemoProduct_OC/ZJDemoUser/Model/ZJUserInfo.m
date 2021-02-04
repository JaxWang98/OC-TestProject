//
//  ZJUserInfo.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2021/2/4.
//  Copyright © 2021 widerness. All rights reserved.
//

#import "ZJUserInfo.h"

@implementation ZJUserInfo

+ (instancetype)sharedUserInfo {
    static ZJUserInfo *userInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[ZJUserInfo alloc] init];
    });
    
    return userInfo;
}


+ (void)updateUserInfo:(ZJUserInfo *)userInfo {
    [ZJUserInfo sharedUserInfo].userName = userInfo.userName;
    [ZJUserInfo sharedUserInfo].sexType = userInfo.sexType;
    [ZJUserInfo sharedUserInfo].phoneNumber = userInfo.phoneNumber;
}

@end
