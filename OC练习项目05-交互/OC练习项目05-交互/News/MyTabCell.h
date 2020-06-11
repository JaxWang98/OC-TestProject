//
//  myTabCell.h
//  OC练习项目04-TableView
//
//  Created by EHI on 2020/6/9.
//  Copyright © 2020 EHI. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol NormalTableViewDelegate <NSObject>

-(void) tableViewCell: (UITableViewCell *)cell clickBtn:(UIButton *)btn;

@end

@interface MyTabCell : UITableViewCell


@property(nonatomic,weak) id<NormalTableViewDelegate> delegate;


-(void) configureUI; //需要暴露给外界的方法再写在声明中

@end

NS_ASSUME_NONNULL_END
