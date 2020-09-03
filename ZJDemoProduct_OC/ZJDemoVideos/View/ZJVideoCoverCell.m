//
//  ZJVideoCoverCell.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/8/12.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJVideoCoverCell.h"
#import <AVFoundation/AVFoundation.h>

@interface ZJVideoCoverCell ()

@property (nonatomic, strong) UIImageView *placeHolderImgView;//占位图片
@property (nonatomic, strong) UIImageView *playView;//播放view
@property (nonatomic, copy) NSString *videoURL;

@end

@implementation ZJVideoCoverCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

#pragma mark -- UI
- (void)setUpUI {
    self.placeHolderImgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.playView.frame = CGRectMake((self.frame.size.width - 50) / 2, (self.frame.size.height - 50) / 2, 50, 50);

    [self addSubview:self.placeHolderImgView];
    [self addSubview:self.playView];

    UITapGestureRecognizer *playTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_didTapPlay)];
    [self addGestureRecognizer:playTap];
}

#pragma mark -- public
- (void)setUpCellWithVideoCoverUrl:(NSString *)coverUrl andVideoUrl:(NSString *)videoUrl {
    self.placeHolderImgView.image = [UIImage imageNamed:coverUrl];
    self.videoURL = videoUrl;
}

#pragma mark -- Action
- (void)_didTapPlay {
    NSLog(@"播放");
    //model
    NSURL *viedoURL = [NSURL URLWithString:self.videoURL];
    AVAsset *asset = [AVAsset assetWithURL:viedoURL];
    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];

    //controller
    AVPlayer *avplayer = [AVPlayer playerWithPlayerItem:videoItem];

    //view
    AVPlayerLayer *playerlayer = [AVPlayerLayer playerLayerWithPlayer:avplayer];
    playerlayer.frame = self.placeHolderImgView.bounds;
    
    [self.layer addSublayer:playerlayer];

    [avplayer play];
}

#pragma mark -- lazy

- (UIImageView *)placeHolderImgView {
    if (!_placeHolderImgView) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _placeHolderImgView = imgView;
    }
    return _placeHolderImgView;
}

- (UIImageView *)playView {
    if (!_playView) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        imgView.image = [UIImage imageNamed:@"videoPlay"];

        _playView = imgView;
    }
    return _playView;
}

@end
