//
//  NewsDetailCell.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZJTableViewDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)cell clickBtn:(UIButton *)btn;

@end

@interface ZJNewsItemCell : UITableViewCell

//协议
@property (nonatomic, weak) id<ZJTableViewDelegate> delegate;

//设置UI数据
- (void)setUIData;
@end

NS_ASSUME_NONNULL_END
