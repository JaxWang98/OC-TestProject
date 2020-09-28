//
//  ZJVideoTooBarView.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/9/28.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//视频列表下方的toolBar
//

#import <UIKit/UIKit.h>
#import "ZJVideoToolBarModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJVideoTooBarView : UIView

- (void)updateUIDataWithModel:(nullable ZJVideoToolBarModel *)model;

@end

NS_ASSUME_NONNULL_END
