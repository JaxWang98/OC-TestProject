//
//  myTabCell.m
//  OC练习项目04-TableView
//
//  Created by EHI on 2020/6/9.
//  Copyright © 2020 EHI. All rights reserved.
//
/*
 开源动画工具
 lottiew facebook/pop
 */

#import "MyTabCell.h"
@interface MyTabCell ()

@property(nonatomic, strong) UILabel *tittleLab;
@property(nonatomic, strong) UILabel *sourceLab;
@property(nonatomic, strong) UILabel *conmmentLab;
@property(nonatomic, strong) UILabel *timeLab;
@property(nonatomic, strong) UIImageView *img;
@property(nonatomic, strong) UIButton *btn;


@end


@implementation MyTabCell

//重写初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:({
            self.tittleLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 250, 70)];
//            self.tittleLab.backgroundColor = [UIColor redColor];
            self.tittleLab.font = [UIFont systemFontOfSize:20 weight:UIFontWeightLight];
            self.tittleLab.textColor = [UIColor blackColor];
            
            self.tittleLab;
        })];
        [self addSubview:({
            self.sourceLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 50, 20)];
//            self.sourceLab.backgroundColor = [UIColor redColor];
            self.sourceLab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
            self.sourceLab.textColor = [UIColor grayColor];
            self.sourceLab;
        })];
        [self addSubview:({
            self.conmmentLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 50, 20)];
//            self.conmmentLab.backgroundColor = [UIColor redColor];
            self.conmmentLab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
            self.conmmentLab.textColor = [UIColor grayColor];
            self.conmmentLab;
        })];
        [self addSubview:({
            self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(150, 100, 50, 20)];
//            self.timeLab.backgroundColor = [UIColor redColor];
            self.timeLab.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
            self.timeLab.textColor = [UIColor grayColor];
            self.timeLab;
        })];
        [self addSubview:({
            self.img = [[UIImageView alloc]initWithFrame:CGRectMake(330, 15, 100, 90)];
            self.img.backgroundColor = [UIColor redColor];
            self.img.contentMode = UIViewContentModeScaleAspectFill;
            self.img;
        })];
        [self addSubview:({
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 30, 20)];
            self.btn.backgroundColor = [UIColor redColor];
            [self.btn setTitle:@"X" forState:UIControlStateNormal];
            [self.btn setTitle:@"Y" forState:UIControlStateHighlighted];
            [self.btn addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [self.btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            self.btn.layer.cornerRadius = 5;
            self.btn.layer.masksToBounds = YES;
            
            self.btn.layer.borderColor = [UIColor blackColor].CGColor;
            self.btn.layer.borderWidth = 1;
            
            self.btn;
        })];
    }
    return self;
}

-(void) configureUI {
    //内容及属性
    self.tittleLab.text = @"结束二战以来最长关闭期 埃菲尔铁塔即将重新开放";
    self.tittleLab.numberOfLines = 0;
    self.tittleLab.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.sourceLab.text = @"王之杰";
    [self.sourceLab sizeToFit];
    
    self.conmmentLab.text = @"28评论";
    [self.conmmentLab sizeToFit];
    self.conmmentLab.frame = CGRectMake(self.sourceLab.frame.origin.x + self.sourceLab.frame.size.width + 15, self.conmmentLab.frame.origin.y, self.conmmentLab.frame.size.width, self.conmmentLab.frame.size.height);
    
    
    self.timeLab.text = @"3分钟前";
    [self.timeLab sizeToFit];
    self.timeLab.frame = CGRectMake(self.conmmentLab.frame.origin.x + self.conmmentLab.frame.size.width + 15, self.timeLab.frame.origin.y, self.timeLab.frame.size.width, self.timeLab.frame.size.height);
    
    self.img.image = [UIImage imageNamed:@"news_img_01"];
//    self.img.animationImages = @[[UIImage imageNamed:@"news_img_01"],[UIImage imageNamed:@"news_img_02"],[UIImage imageNamed:@"news_img_03"]];
//    self.img.animationDuration = 3;
//    [self.img startAnimating];
    
    self.img.clipsToBounds = YES;
    self.img.frame = CGRectMake(self.tittleLab.frame.origin.x + self.tittleLab.frame.size.width +15, self.img.frame.origin.y, self.img.frame.size.width, self.img.frame.size.height);
    

    
    self.btn.frame = CGRectMake(self.img.frame.origin.x - self.btn.frame.size.width - 15, self.btn.frame.origin.y, self.btn.frame.size.width, self.btn.frame.size.height);
    
    
}

- (void) deleteButtonClick{
    NSLog(@"点击了");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickBtn:)]) {
        [self.delegate tableViewCell:self clickBtn:self.btn];
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

