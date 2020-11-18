//
//  ZJSplashView.m
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/11/18.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJSplashView.h"
#import "ZJScreen.h"

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
    self.backgroundColor = UIColor.blackColor;
    
    //    _avatorImageView.image = [UIImage imageNamed:@"icon.bundle"];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"LaunchScreen"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = UIColor.clearColor;
    [btn setTintColor:UIColor.blackColor];
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(removeSplashView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:imageView];
    [self addSubview:btn];
    
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    btn.frame = AutoUIRect(330, 100, 60, 40);
    [btn sizeToFit];
}


//MARK: Action

/// 移除SplashView
- (void)removeSplashView {
    [self removeFromSuperview];
}

@end
