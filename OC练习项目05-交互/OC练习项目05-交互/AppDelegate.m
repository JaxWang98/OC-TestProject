//
//  AppDelegate.m
//  OC练习项目05-交互
//
//  Created by EHI on 2020/6/10.
//  Copyright © 2020 EHI. All rights reserved.
//
/*
  iOS中的动画 CoreAnimation --> UIview动画
                          --> UIKit组件自带动画
 UIView动画
    %80动画效果
    处理基本的frame alpha transform
    实现只需要两步
    设置动画参数
    动画终止时属性的最终值
 */

#import "AppDelegate.h"
#import "TabiewController.h"
#import "CollectionViewController.h"
#import "ScrollViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    
   
    TabiewController *vc1 = [[TabiewController alloc]init];
    CollectionViewController *vc2 = [CollectionViewController new];
    ScrollViewController *vc3 = [ScrollViewController new];

    
    
    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor greenColor];
    vc4.tabBarItem.title = @"我的";
    vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_serviceCenter_normal"];

    UITabBarController *myTabBar = [[UITabBarController alloc]init];
    [myTabBar setViewControllers:@[vc1,vc2,vc3,vc4]];
    myTabBar.delegate = self;
    
    
    UINavigationController *myNavi = [[UINavigationController alloc]initWithRootViewController:myTabBar];
    
    self.window.rootViewController = myNavi; //主流目前是这种结构
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    NSLog(@"选中了");
}

@end


