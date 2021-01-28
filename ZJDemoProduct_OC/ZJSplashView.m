//
//  ZJSplashView.m
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/11/18.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJSplashView.h"
#import "ZJScreenDefines.h"

@implementation ZJSplashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    self.backgroundColor = UIColor.whiteColor;
    
    //    _avatorImageView.image = [UIImage imageNamed:@"icon.bundle"];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"ZJLaunchImage"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = UIColor.clearColor;
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(removeSplashView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:imageView];
    [self addSubview:btn];
    [self bringSubviewToFront:btn];
    
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    btn.frame = AutoUIRect(330, 100, 60, 40);
    [btn sizeToFit];
}


#pragma mark -- Action
/// 移除SplashView
- (void)removeSplashView {
    [self removeFromSuperview];
}

@end
