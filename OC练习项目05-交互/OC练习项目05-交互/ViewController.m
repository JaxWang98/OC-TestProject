//
//  ViewController.m
//  OC练习项目04-TableView
//
//  Created by EHI on 2020/6/9.
//  Copyright © 2020 EHI. All rights reserved.
//
/*
 tableView复用机制
    cell复用池
 tableView的section和row
 
 UIImageView 动图
 animationImages
 animationDuration
 startAnimating
 */

#import "TabiewController.h"
#import "MyTabCell.h"
#import "WebViewController.h"
#import "DeleteView.h"

//int i = 0;
@interface TabiewController () <UITableViewDelegate,UITableViewDataSource,NormalTableViewDelegate>
@property(nonatomic,strong) UITableView *myTab;
@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation TabiewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.dataArray = [NSMutableArray new];
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_main_normal"];
        
        for (int i = 0; i<20; i++) {
            [self.dataArray addObject:@(i)];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTab = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    
    [self.view addSubview:self.myTab];
    
}


//MARK: DataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MyTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[MyTabCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    
    [cell configureUI];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

//MARK: TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WebViewController *vc = [WebViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"序号%ld",(long)indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)tableViewCell:(UITableViewCell *)cell clickBtn:(UIButton *)btn{
    NSLog(@"执行tabcell的delegate");
    DeleteView *deleteView = [[DeleteView alloc]initWithFrame:self.view.bounds];
    CGRect rect = [cell convertRect:btn.frame toView:nil]; //rect坐标转换，nil代表以window坐标为基准
    
    __weak typeof(self) wself =self;
    [deleteView showDeleteViewFromPoint:rect.origin withBlock:^{
        NSLog(@"1");
        __strong typeof(self)strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.myTab deleteRowsAtIndexPaths:@[[strongSelf.myTab indexPathForCell:cell]] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    //通过delegate回调，得到了btn坐标
    //block回调，执行了删除函数
    
    
}

@end
