//
//  DeleteCellView.m
//  OC练习项目05-交互
//
//  Created by EHI on 2020/6/11.
//  Copyright © 2020 EHI. All rights reserved.
//

#import "DeleteView.h"

//typedef void(^deleteBlock)(void);


@interface DeleteView ()

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) dispatch_block_t deleteBlock;


@end


@implementation DeleteView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backView = [[UIView alloc]initWithFrame:self.bounds];
        self.backView.backgroundColor = [UIColor blackColor];
        self.backView.alpha = 0.5;
        
        self.btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];//动画初始状态
        [self.btn addTarget:self action:@selector(btnClicK) forControlEvents:UIControlEventTouchUpInside];
        self.btn.backgroundColor = [UIColor redColor];
        
        [self addSubview:_backView];
        [self addSubview:_btn];
        
        UITapGestureRecognizer *tapHandler = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeDeleteView)];
        [self.backView addGestureRecognizer:tapHandler];
        
    }
    return self;
}

-(void) btnClicK{
    if (self.deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

-(void) showDeleteViewFromPoint:(CGPoint)point withBlock:(dispatch_block_t)clickBlock{
    
    
    
    self.btn.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [clickBlock copy];
    
    [UIApplication.sharedApplication.keyWindow addSubview:self];//把self加载到window上，确保在最顶层
//    [UIView animateWithDuration:1.f animations:^{
//        self.btn.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height -200)/2, 200, 200);
//    }];//动画结束状态
    [UIView animateWithDuration:1.f delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAutoreverse animations:^{
        [UIView animateWithDuration:1.f animations:^{
            self.btn.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height -200)/2, 200, 200);
        }];//动画结束状态
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}
-(void) removeDeleteView{
    [self removeFromSuperview];
}

@end
