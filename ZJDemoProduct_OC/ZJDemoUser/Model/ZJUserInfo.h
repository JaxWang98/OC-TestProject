//
//  ZJUserInfo.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2021/2/4.
//  Copyright © 2021 widerness. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZJUserSexType) {
    ZJUserSexTypeMan = 1001,            ///男
    ZJUserSexTypeWoman,                 ///女
    ZJUserSexTypeSecret,                ///保密
};

@interface ZJUserInfo : NSObject

#pragma mark -- property
/// 用户名
@property (nonatomic, strong) NSString *userName;
/// 手机号
@property (nonatomic, strong) NSString *phoneNumber;
/// 性别
@property (nonatomic, assign) ZJUserSexType sexType;

#pragma mark -- method

/// 单例
+ (instancetype)sharedUserInfo;

/// 更新用户信息单例
+ (void)updateUserInfo:(ZJUserInfo *)userInfo;

@end

NS_ASSUME_NONNULL_END
