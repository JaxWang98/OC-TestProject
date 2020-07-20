//
//  ZJNewsDeleteView.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/20.
//  Copyright © 2020 widerness. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJNewsDeleteView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point withBlock:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END
