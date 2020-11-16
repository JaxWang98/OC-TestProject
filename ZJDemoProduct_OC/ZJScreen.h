//
//  ZJGreen.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/9/30.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//UI适配，支持不同分辨率和横屏支持
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//判断当前是否横屏
//取当前设备的statusBar方向，用来判断当前设备是否横屏
#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication]statusBarOrientation]))

//根据横屏与否来设置屏幕宽度
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
//根据横屏与否来设置屏幕高度
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

//全面屏适配
#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)

//status高度
#define STATUSBAR_HEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)

//简写
#define UI(x) UIAdapter(x)
#define UIRect(x,y,height,width) UIRectAdapter(x,y,width,height)

//返回适配后的数值
static inline NSInteger UIAdapter(float x) {
    //1 - 分机型 特定的比例
    
    //2 - 根据屏幕宽度按比例适配
    //统一根据屏幕宽度的比例来适配其实有点不太科学，最好是高度和宽度分开适配
    CGFloat scale = 414 / SCREEN_WIDTH;
    return  (NSUInteger)x /scale;
}

//返回适配后的CGRect
static inline CGRect UIRectAdapter(x,y,width,height) {
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}


@interface ZJScreen : NSObject

//iphone xs max 6.5寸
+ (CGSize)sizeFor65Inch;
//iphone xr max 6.1寸
+ (CGSize)sizeFor61Inch;
//iphone x 5.8Inch
+ (CGSize)sizeFor58Inch;
//...其它机型
@end

NS_ASSUME_NONNULL_END
