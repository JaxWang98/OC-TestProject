//
//  ZJVideoCoverCell.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/8/12.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//视频播放cell
//

#import "ZJVideoCoverCell.h"
#import <AVFoundation/AVFoundation.h>
#import "ZJVideoPlayer.h"
#import "ZJVideoTooBarView.h"

@interface ZJVideoCoverCell ()

@property (nonatomic, strong) UIImageView *placeHolderImgView;//占位图片
@property (nonatomic, strong) UIImageView *playView;//播放view
@property (nonatomic, strong) ZJVideoTooBarView *toolBar;
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
    [self addSubview:self.toolBar];

    UITapGestureRecognizer *playTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_didTapPlay)];
    [self addGestureRecognizer:playTap];
}


#pragma mark -- public
- (void)setUpCellWithVideoCoverUrl:(NSString *)coverUrl andVideoUrl:(NSString *)videoUrl {
    self.placeHolderImgView.image = [UIImage imageNamed:coverUrl];
    self.videoURL = videoUrl;
    [self.toolBar updateUIDataWithModel:nil];
}

#pragma mark -- Action
- (void)_didTapPlay {
    NSLog(@"播放");
    [[ZJVideoPlayer sharedPlayer] playVideoWithURL:self.videoURL andAttachView:self.placeHolderImgView];
    [self.playView removeFromSuperview];
    
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

- (ZJVideoTooBarView *)toolBar {
    if (!_toolBar) {
        _toolBar = [[ZJVideoTooBarView alloc] initWithFrame:CGRectMake(0, _playView.bounds.size.height, self.frame.size.width, 60)];
    }
    return  _toolBar;
}

@end
