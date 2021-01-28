//
//  ZJGreen.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/9/30.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJScreenDefines.h"

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication]statusBarOrientation]))



@implementation ZJScreenDefines

//iphone xs max 6.5寸
+ (CGSize)sizeFor65Inch {
    return CGSizeMake(414, 896);
}
//iphone xr max 6.1寸
+ (CGSize)sizeFor61Inch {
    return CGSizeMake(414, 896);

}
//iphone x 5.8Inch
+ (CGSize)sizeFor58Inch {
    return CGSizeMake(414, 896);

}


@end
