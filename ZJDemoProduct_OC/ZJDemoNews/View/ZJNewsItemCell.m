//
//  NewsDetailCell.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsItemCell.h"
@interface ZJNewsItemCell ()

//UI控件
@property (nonatomic, strong) UILabel *tittleLab;
@property (nonatomic, strong) UILabel *sourceLab;
@property (nonatomic, strong) UILabel *conmmentLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ZJNewsItemCell

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self setUpUI];
//        [self layOutUI];
//    }
//    return self;
//}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setUpUI];
//        [self layOutUI];
//    }
//    return self;
//}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
        [self layOutUI];
    }
    return self;
}

- (void)setUpUI {
    [self.contentView addSubview:self.tittleLab];
    [self.contentView addSubview:self.sourceLab];
    [self.contentView addSubview:self.conmmentLab];
    [self.contentView addSubview:self.timeLab];
    [self.contentView addSubview:self.img];
    [self.contentView addSubview:self.btn];
}

- (void)layOutUI {

    self.conmmentLab.frame = CGRectMake(self.sourceLab.frame.origin.x + self.sourceLab.frame.size.width + 15, self.conmmentLab.frame.origin.y, self.conmmentLab.frame.size.width, self.conmmentLab.frame.size.height);
    self.timeLab.frame = CGRectMake(self.conmmentLab.frame.origin.x + self.conmmentLab.frame.size.width + 15, self.timeLab.frame.origin.y, self.timeLab.frame.size.width, self.timeLab.frame.size.height);
    self.img.frame = CGRectMake(self.tittleLab.frame.origin.x + self.tittleLab.frame.size.width + 15, self.img.frame.origin.y, self.img.frame.size.width, self.img.frame.size.height);
    self.btn.frame = CGRectMake(self.img.frame.origin.x - self.btn.frame.size.width - 15, self.btn.frame.origin.y, self.btn.frame.size.width, self.btn.frame.size.height);
}

#pragma mark -- Action
- (void)deleteButtonClick {
    NSLog(@"deletClick");

    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickBtn:)]) {
        [self.delegate tableViewCell:self clickBtn:self.btn];
    }
}
- (void)setUIData{
    [self setUpUI];
    [self layOutUI];
}


#pragma mark -- LazyLoad

- (UILabel *)tittleLab {
    if (!_timeLab) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 250, 70)];
        lab.font = [UIFont systemFontOfSize:20 weight:UIFontWeightLight];
        lab.textColor = [UIColor blackColor];

        lab.text = @"结束二战以来最长关闭期 埃菲尔铁塔即将重新开放";
        lab.numberOfLines = 0;
        lab.lineBreakMode = NSLineBreakByWordWrapping;

        _tittleLab = lab;
    }
    return _tittleLab;
}

- (UILabel *)sourceLab {
    if (!_sourceLab) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 50, 20)];
        //            self.sourceLab.backgroundColor = [UIColor redColor];
        lab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        lab.textColor = [UIColor grayColor];

        lab.text = @"王之杰";
        [lab sizeToFit];

        _sourceLab = lab;
    }
    return _sourceLab;
}

- (UILabel *)conmmentLab {
    if (!_conmmentLab) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 50, 20)];

        lab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        lab.textColor = [UIColor grayColor];

        lab.text = @"28评论";
        [lab sizeToFit];

        _conmmentLab = lab;
    }
    return _conmmentLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(150, 100, 50, 20)];
        //            self.timeLab.backgroundColor = [UIColor redColor];
        lab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        lab.textColor = [UIColor grayColor];

        lab.text = @"3分钟前";
        [lab sizeToFit];

        _timeLab = lab;
    }
    return _timeLab;
}

- (UIImageView *)img {
    if (!_img) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(330, 15, 100, 90)];
        img.backgroundColor = [UIColor redColor];
        img.contentMode = UIViewContentModeScaleAspectFill;

        img.image = [UIImage imageNamed:@"news_img_01"];
        img.clipsToBounds = YES;

        _img = img;
    }
    return _img;
}

- (UIButton *)btn {
    if (!_btn) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 30, 20)];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"X" forState:UIControlStateNormal];
        [btn setTitle:@"Y" forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;

        btn.layer.borderColor = [UIColor blackColor].CGColor;
        btn.layer.borderWidth = 1;
        _btn = btn;
    }
    return _btn;
}

@end
