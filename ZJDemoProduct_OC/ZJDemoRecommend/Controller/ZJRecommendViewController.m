//
//  ZJRecommendViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJRecommendViewController.h"

@interface ZJRecommendViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ZJRecommendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_userCenter_normal"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

#pragma mark -- UI
- (void)setUpUI {
    self.view.backgroundColor = UIColor.whiteColor;
    _colorArray = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor purpleColor]];
    [self.view addSubview:self.scrollView];
}

- (void)layOutUI {
}

#pragma mark -- LazyLoad
//- (NSArray *)colorArray {
//    if (!_colorArray) {
//        NSArray *array = [NSArray array];
//        array = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor purpleColor]];
//        _colorArray = array;
//    }
//    return _colorArray;
//}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        UIScrollView *myScroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        myScroll.backgroundColor = [UIColor grayColor];
        myScroll.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size
                                          .height);
        myScroll.directionalLockEnabled = YES;
        myScroll.pagingEnabled = YES;
        myScroll.showsHorizontalScrollIndicator = NO;
        myScroll.delegate = self;

        for (int i = 0; i < 5; i++) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            UIView *subView =  [[UIView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
            subView.backgroundColor = [UIColor blackColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler)];
            tapGesture.delegate = self;
            [subView addGestureRecognizer:tapGesture];
            [view addSubview:subView];

            view.backgroundColor = [_colorArray objectAtIndex:i];
            [myScroll addSubview:view];
        }
        _scrollView = myScroll;
    }
    return _scrollView;
}

//MARK: Target
- (void)tapHandler {
    NSLog(@"tap");
}

//MARK: ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll: %f", scrollView.contentOffset.x);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
}

@end
