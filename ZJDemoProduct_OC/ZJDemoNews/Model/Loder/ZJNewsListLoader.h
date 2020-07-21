//
//  NewsListLoader.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//
/*
 新闻列表数据请求
 */


#import <Foundation/Foundation.h>
@class ZJNewsListModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZJNewsLoaderFinishBlock)(BOOL success, NSArray<ZJNewsListModel *> *dataArray);


@interface ZJNewsListLoader : NSObject

- (void)loadListDataWithFinishBlock:(ZJNewsLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
