//
//  NewsListLoader.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsListLoader.h"
#import "AFNetworking.h"

@implementation ZJNewsListLoader

- (void)loadListData {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
//    NSString *urlString = @"https://v.jube.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";

//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress *_Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
//        NSLog(@"success");
//    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
//        NSLog(@"fail");
//    }];

    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
//        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        id jsonObj =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        NSLog(@"请求完毕");
    }];

    [dataTask resume];

    NSLog(@"load");
}

@end
