//
//  AppDelegate.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//
/*
    tabbar和navigation写在这里
 */

#import "AppDelegate.h"

#import "ZJNewsListViewController.h"
#import "ZJVideosViewController.h"
#import "ZJRecommendViewController.h"
#import "ZJUserViewController.h"

#import "ZJSplashView.h"


@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];

    
    ZJNewsListViewController *vc1 = [[ZJNewsListViewController alloc]init];
    ZJVideosViewController *vc2 = [[ZJVideosViewController alloc]init];
    ZJRecommendViewController *vc3 = [[ZJRecommendViewController alloc]init];
    ZJUserViewController *vc4 = [[ZJUserViewController alloc]init];

    
    
    UITabBarController *myTabBar = [[UITabBarController alloc]init];
    [myTabBar setViewControllers:@[vc1, vc2, vc3, vc4]];
    myTabBar.delegate = self;

    UINavigationController *myNavi = [[UINavigationController alloc]initWithRootViewController:myTabBar];

    self.window.rootViewController = myNavi;    //主流目前是这种结构
    [self.window makeKeyAndVisible];
    
    ZJSplashView *splashView = [[ZJSplashView alloc] initWithFrame:self.window.bounds];
    [self.window addSubview:splashView];
    
    return YES;
}

#pragma mark -- Scheme
//使得app支持从其他app中跳转而来s
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}
@end
