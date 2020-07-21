//
//  NewsListLoader.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsListLoader.h"
#import "AFNetworking.h"
#import "ZJNewsListModel.h"

@implementation ZJNewsListLoader

- (void)loadListDataWithFinishBlock:(ZJNewsLoaderFinishBlock)finishBlock {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";

    NSURL *listURL = [NSURL URLWithString:urlString];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
//        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
#warning 类型检查
        NSArray *dataArray =  [(NSDictionary *)(([(NSDictionary *)jsonObj objectForKey:@"result"])) objectForKey:@"data"];
        NSMutableArray *listItemArray = [NSMutableArray array];
        for (NSDictionary *dicItem in dataArray) {
            ZJNewsListModel *listItem = [[ZJNewsListModel alloc]init];
            [listItem configWithDictionary:dicItem];
            [listItemArray addObject:listItem];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });

        NSLog(@"请求完毕");
    }];

    [dataTask resume];

    NSLog(@"load");
}

@end
