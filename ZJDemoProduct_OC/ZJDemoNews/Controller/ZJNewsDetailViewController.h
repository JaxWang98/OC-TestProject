//
//  ZJNewsDetailViewController.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJNewsDetailViewController : UIViewController<ZJNewsDetailViewControllerProtocol>


- (instancetype)initWithURL:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
