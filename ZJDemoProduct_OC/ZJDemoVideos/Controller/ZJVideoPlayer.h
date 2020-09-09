//
//  ZJVideoPlayer.h
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/9/9.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//视频播放逻辑单例
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJVideoPlayer : NSObject

+ (ZJVideoPlayer *)sharedPlayer;

- (void)playVideoWithURL:(NSString *)videoUrl
           andAttachView:(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END
