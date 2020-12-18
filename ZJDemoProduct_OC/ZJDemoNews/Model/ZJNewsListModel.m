//
//  ZJNewsListModel.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/21.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//归档解归档，可以使用YYModel实现
//
#import "ZJNewsListModel.h"


@implementation ZJNewsListModel
// 解码/反序列化/解归档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.thumbnaiPicS =  [aDecoder  decodeObjectForKey:@"thumbnaiPicS"];
        self.uniKey = [aDecoder  decodeObjectForKey:@"uniKey"];
        self.title =  [aDecoder  decodeObjectForKey:@"title"];
        self.date =  [aDecoder  decodeObjectForKey:@"date"];
        self.author =  [aDecoder  decodeObjectForKey:@"author"];
        self.thumbnailPicS03 =  [aDecoder  decodeObjectForKey:@"thumbnailPicS03"];
        self.thumbnailPicS02 =  [aDecoder  decodeObjectForKey:@"thumbnailPicS02"];
        self.url =  [aDecoder  decodeObjectForKey:@"url"];
    }
    return self;
}

// 编码/序列化/归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.thumbnaiPicS forKey:@"thumbnaiPicS"];
    [coder encodeObject:self.uniKey forKey:@"uniKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.author forKey:@"author"];
    [coder encodeObject:self.thumbnailPicS03 forKey:@"thumbnailPicS03"];
    [coder encodeObject:self.thumbnailPicS02 forKey:@"thumbnailPicS02"];
    [coder encodeObject:self.url forKey:@"url"];


}
+ (BOOL)supportsSecureCoding {
    return  YES;
}


- (void)configWithDictionary:(NSDictionary *)dic {
    
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
