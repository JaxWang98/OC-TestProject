//
//  ZJNewsListModel.h
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/21.
//  Copyright © 2020 widerness. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJNewsListModel : NSObject

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *thumbnaiPicS;
@property (nonatomic, copy) NSString *uniKey;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *thumbnailPicS03;
@property (nonatomic, copy) NSString *thumbnailPicS02;
@property (nonatomic, copy) NSString *url;

-(void)configWithDictionary:(NSDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
