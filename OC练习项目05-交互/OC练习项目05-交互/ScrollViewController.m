//
//  ScrollViewController.m
//  OC练习项目04-TableView
//
//  Created by EHI on 2020/6/9.
//  Copyright © 2020 EHI. All rights reserved.
//
/*
 UIScrollView
 contentSIze 视图内部内容可以滚动的区域
 contentOffSet
 
 应用场景
    滚动展示
    图片zoom
 */
#import "ScrollViewController.h"

@interface ScrollViewController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation ScrollViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *myScroll  = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    myScroll.backgroundColor = [UIColor grayColor];
    myScroll.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size
                                      .height);
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor purpleColor]];
    for (int i = 0; i<5; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        [view addSubview:({
            UIView *subView =  [[UIView alloc]initWithFrame:CGRectMake(100, 200, 50 ,50)];
            subView.backgroundColor = [UIColor blackColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler)];
            tapGesture.delegate = self;
            [subView addGestureRecognizer:tapGesture];
            subView;
        })];

        
        
        view.backgroundColor = [colorArray objectAtIndex:i];
        [myScroll addSubview:view];
    }
    myScroll.directionalLockEnabled = YES;
    myScroll.pagingEnabled = YES;
    myScroll.showsHorizontalScrollIndicator = NO;
    myScroll.delegate = self;
    
    [self.view addSubview:myScroll];
}

//MARK: Target
-(void) tapHandler{
    NSLog(@"tap");
}




//MARK: ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSLog(@"scrollViewDidScroll: %f",scrollView.contentOffset.x);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

@end

//MARK: Gesture
