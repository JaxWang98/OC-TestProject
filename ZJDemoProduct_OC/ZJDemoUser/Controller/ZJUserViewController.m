//
//  ZJUserViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJUserViewController.h"

@interface ZJUserViewController ()

@end

@implementation ZJUserViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_serviceCenter_normal"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

#pragma mark -- UI
- (void)setUpUI {
    self.view.backgroundColor = UIColor.greenColor;
}

- (void)layOutUI {
}

#pragma mark -- LazyLoad

@end
