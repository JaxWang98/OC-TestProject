//
//  ZJVideoCoverCell.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/8/12.
//  Copyright © 2020 widerness. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJVideoCoverCell : UICollectionViewCell


- (void)setUpCellWithVideoCoverUrl:(NSString *)coverUrl
                       andVideoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
