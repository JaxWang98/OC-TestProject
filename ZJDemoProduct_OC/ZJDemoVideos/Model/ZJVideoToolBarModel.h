//
//  ZJVideoToolBarModel.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/9/28.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//视频工具栏对应的Model
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJVideoToolBarModel : NSObject

@property (nonatomic, strong) NSString *sourceString;
@property (nonatomic, strong) NSString *commentString;
@property (nonatomic, strong) NSString *likeString;
@property (nonatomic, strong) NSString *shareString;

@end

NS_ASSUME_NONNULL_END
