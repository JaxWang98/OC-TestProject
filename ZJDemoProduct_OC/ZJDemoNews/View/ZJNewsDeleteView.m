//
//  ZJNewsDeleteView.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/20.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsDeleteView.h"
#import "ZJFunctionDefines.h"

@interface ZJNewsDeleteView ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) dispatch_block_t deleteBlock;

@end

@implementation ZJNewsDeleteView

#pragma mark -- UI

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    [self addSubview:self.backView];
    [self addSubview:self.btn];

    UITapGestureRecognizer *tapHandler = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeDeleteView)];
    [self.backView addGestureRecognizer:tapHandler];
}

#pragma mark -- callBack &action
- (void)showDeleteViewFromPoint:(CGPoint)point withBlock:(dispatch_block_t)clickBlock {
    self.btn.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [clickBlock copy];
    
    [UIApplication.sharedApplication.keyWindow addSubview:self];//把self加载到window上，确保在最顶层
    [UIView animateWithDuration:1.f delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAutoreverse animations:^{
        ZJWeakSelf(self);
        [UIView animateWithDuration:1.f animations:^{
            ZJStrongSelf(self);
            self.btn.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
        }];//动画结束状态
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}

- (void)btnClicK {
    if (self.deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}
- (void)removeDeleteView {
    [self removeFromSuperview];
}

#pragma mark -- lazyLoad
- (UIView *)backView {
    if (!_backView) {
        UIView *view = [[UIView alloc]initWithFrame:self.bounds];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        _backView = view;
    }
    return _backView;
}

- (UIButton *)btn {
    if (!_btn) {
        UIButton *btn =  [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];//动画初始状态
        [btn addTarget:self action:@selector(btnClicK) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor redColor];
        _btn = btn;
    }
    return _btn;
}

@end
