//
//  ZJVideoPlayer.m
//  ZJDemoProduct_OC
//
//  Created by mac on 2020/9/9.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface ZJVideoPlayer ()

@property (nonatomic, strong) AVPlayerItem *videoItem;//播放器item
@property (nonatomic, strong) AVPlayer *avPlayer;//播放器layer
@property (nonatomic, strong) AVPlayerLayer *playerLayer;//播放器layer

@end

@implementation ZJVideoPlayer

+ (ZJVideoPlayer *)sharedPlayer {
    static ZJVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[ZJVideoPlayer alloc] init];
    });
    return player;
}

- (void)playVideoWithURL:(NSString *)videoUrl andAttachView:(UIView *)attachView {
    
    [self _stopPlay];

    //model
    NSURL *viedoURL = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:viedoURL];
    self.videoItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    CMTime duration = self.videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);

    //controller
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.videoItem];
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度:%@", @(CMTimeGetSeconds(time)));
    }];
    //view
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.playerLayer.frame = attachView.bounds;


    [attachView.layer addSublayer:self.playerLayer];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

- (void)_stopPlay {
//        移除播放器
    [self.playerLayer removeFromSuperlayer];
    [self.videoItem removeObserver:self forKeyPath:@"status"];
    [self.videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    self.videoItem = nil;
    self.avPlayer = nil;
}

- (void)_handlePlayEnd {
    NSLog(@"播放结束");
    //重复播放
    [self.avPlayer seekToTime:CMTimeMake(0, 1)]; //seek到第0秒
    [self.avPlayer play];
}

#pragma mark --KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        NSNumber *changeValue = (NSNumber *)[change objectForKey:NSKeyValueChangeNewKey];
        if (changeValue.integerValue == AVPlayerItemStatusReadyToPlay) {
            [self.avPlayer play];
        } else {
            NSLog(@"不要播放");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"缓冲%@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
