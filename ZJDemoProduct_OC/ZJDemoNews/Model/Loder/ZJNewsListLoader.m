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
    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(weakSelf) self = weakSelf;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
#warning 类型检查
        NSArray *dataArray =  [(NSDictionary *)(([(NSDictionary *)jsonObj objectForKey:@"result"])) objectForKey:@"data"];
        NSMutableArray *listItemArray = [NSMutableArray array];
        for (NSDictionary *dicItem in dataArray) {
            ZJNewsListModel *listItem = [[ZJNewsListModel alloc]init];
            [listItem configWithDictionary:dicItem];
            [listItemArray addObject:listItem];
            [self _archiveListDtaWithArray:listItemArray.copy];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });

        NSLog(@"请求完毕");
    }];

    [dataTask resume];
//    [self _getSandBoxPath];

    NSLog(@"load");
}

- (void)_archiveListDtaWithArray:(NSArray<ZJNewsListModel *> *) modelArray{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileMannager = [NSFileManager defaultManager];
    
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"ZJData"];
    NSError *creatError;
    [fileMannager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
//    NSData *listData = [@"ZJTest" dataUsingEncoding:NSUTF8StringEncoding];
    //序列化
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:modelArray requiringSecureCoding:YES error:nil];
    [fileMannager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    
    
    NSData *readListData = [fileMannager contentsAtPath:listDataPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ZJNewsListModel class], nil] fromData:readListData error:nil];
    
    //查询文件
//    BOOL fileExist = [fileMannager fileExistsAtPath:listDataPath];
    
    //删除
//    if (fileExist) {
//        [fileMannager removeItemAtPath:listDataPath error:nil];
//    }
    
    //追加文件内容
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandle seekToEndOfFile];//调整到文件末尾
//    [fileHandle writeData:[@"追加" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile]; //更新
//    [fileHandle closeFile]; //关闭
    
    NSLog(@"");
}

@end
