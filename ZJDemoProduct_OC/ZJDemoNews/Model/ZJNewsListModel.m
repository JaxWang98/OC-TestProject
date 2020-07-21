//
//  ZJNewsListModel.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/21.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsListModel.h"

@implementation ZJNewsListModel


- (void)configWithDictionary:(NSDictionary *)dic {
    
#warning 类型是否匹配
    self.category = [dic objectForKey:@"category"];
    self.thumbnaiPicS = [dic objectForKey:@"thumbnail_pic_s"];
    self.uniKey = [dic objectForKey:@"uniquekey"];
    self.title = [dic objectForKey:@"title"];
    self.date = [dic objectForKey:@"date"];
    self.author = [dic objectForKey:@"author_name"];
    self.thumbnailPicS03 = [dic objectForKey:@"thumbnail_pic_s03"];
    self.thumbnailPicS02 = [dic objectForKey:@"thumbnail_pic_s02"];
    self.url = [dic objectForKey:@"url"];
    
}

@end
