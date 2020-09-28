//
//  ZJVideoTooBarView.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/9/28.
//  Copyright © 2020 widerness. All rights reserved.
//
//
//本文件，在GEEKTime中，是用来讲解系统api 的autolayout的，个人觉得实在没有必要去研究，太难用了，这里直接用Masonry写一下
//

#import "ZJVideoTooBarView.h"
#import <Masonry/Masonry.h>

@interface ZJVideoTooBarView()

@property (nonatomic, strong, readwrite) UIImageView *avatorImageView;//作者icon
@property (nonatomic, strong, readwrite) UILabel *nickLabel;//作者lab

@property (nonatomic, strong, readwrite) UIImageView *commentImageView;//评论数icon
@property (nonatomic, strong, readwrite) UILabel *commentLabel;//评论数lab

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;//点赞数icon
@property (nonatomic, strong, readwrite) UILabel *likeLabel;//点赞数lab

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;//分享icon
@property (nonatomic, strong, readwrite) UILabel *shareLabel;//分享lab

@end


@implementation ZJVideoTooBarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

#pragma mark -- UI
- (void)setUpUI {
    [self addSubview:self.avatorImageView];
    [self addSubview:self.nickLabel];
    [self addSubview:self.commentImageView];
    [self addSubview:self.commentLabel];
    [self addSubview:self.likeImageView];
    [self addSubview:self.likeLabel];
    [self addSubview:self.shareImageView];
    [self addSubview:self.shareLabel];
    [self layOutUI];

}

- (void)layOutUI {
    [self.avatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(15);
    }];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.avatorImageView.mas_right).offset(5);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    [self.commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(self.mas_centerX);
        make.width.height.mas_equalTo(15);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.commentImageView.mas_right).offset(5);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(15);
    }];
    [self.likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.commentLabel.mas_right).offset(15);
        make.width.height.mas_equalTo(15);
    }];
    [self.likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.likeImageView.mas_right).offset(5);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(15);
    }];
    [self.shareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.likeLabel.mas_right).offset(15);
        make.width.height.mas_equalTo(15);
    }];
    [self.shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.shareImageView.mas_right).offset(5);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];

}
#pragma mark -- 数据处理
- (void)updateUIDataWithModel:(ZJVideoToolBarModel *)model {
    _avatorImageView.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    _nickLabel.text = @"极客时间";

    _commentImageView.image = [UIImage imageNamed:@"comment"];
    _commentLabel.text = @"100";

    _likeImageView.image = [UIImage imageNamed:@"praise"];
    _likeLabel.text = @"25";

    _shareImageView.image = [UIImage imageNamed:@"share"];
    _shareLabel.text = @"分享";
}


#pragma mark -- private

- (UILabel *)_createLab {
    UILabel *lab = [[UILabel alloc] init];
    lab.layer.masksToBounds = YES;
    lab.layer.cornerRadius = 15;
    lab.translatesAutoresizingMaskIntoConstraints = NO;
    return lab;
}

- (UIImageView *)_createImageView {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectZero];
    img.layer.masksToBounds = YES;
    img.layer.cornerRadius = 15;
    img.translatesAutoresizingMaskIntoConstraints = NO;
    return img;
}


#pragma mark -- lazy

- (UIImageView *)avatorImageView {
    if (_avatorImageView) {
        _avatorImageView = [self _createImageView];
    }
    return _avatorImageView;
}

- (UILabel *)nickLabel {
    if (!_nickLabel) {
        _nickLabel = [self _createLab];
    }
    return _nickLabel;
}
- (UIImageView *)commentImageView {
    if (_avatorImageView) {
        _avatorImageView = [self _createImageView];
    }
    return _avatorImageView;
}

- (UILabel *)commentLabel {
    if (!_nickLabel) {
        _nickLabel = [self _createLab];
    }
    return _nickLabel;
}
- (UIImageView *)likeImageView {
    if (_avatorImageView) {
        _avatorImageView = [self _createImageView];
    }
    return _avatorImageView;
}

- (UILabel *)likeLabel {
    if (!_nickLabel) {
        _nickLabel = [self _createLab];
    }
    return _nickLabel;
}
- (UIImageView *)shareImageView {
    if (_avatorImageView) {
        _avatorImageView = [self _createImageView];
    }
    return _avatorImageView;
}

- (UILabel *)shareLabel {
    if (!_nickLabel) {
        _nickLabel = [self _createLab];
    }
    return _nickLabel;
}


@end
