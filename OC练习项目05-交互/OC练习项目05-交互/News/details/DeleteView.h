//
//  DeleteCellView.h
//  OC练习项目05-交互
//
//  Created by EHI on 2020/6/11.
//  Copyright © 2020 EHI. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface DeleteView : UIView


-(void) showDeleteViewFromPoint:(CGPoint)point withBlock:(dispatch_block_t)clickBlock;


@end

NS_ASSUME_NONNULL_END
