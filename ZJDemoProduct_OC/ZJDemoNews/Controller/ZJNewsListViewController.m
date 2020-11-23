//
//  ZJNewsListViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJNewsListViewController.h"

#import "ZJNewsListLoader.h"
#import "ZJNewsItemCell.h"
//#import "ZJNewsDetailViewController.h"
#import "ZJNewsDeleteView.h"
#import "ZJNewsListModel.h"

#import "ZJMediator.h"

const NSString *tabID = @"tabID";

@interface ZJNewsListViewController () <UITableViewDelegate, UITableViewDataSource, ZJTableViewDelegate>

//model
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) ZJNewsListLoader *listLoader;

//UI控件
@property (nonatomic, strong) UITableView *newsTab;

@end

@implementation ZJNewsListViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"page"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected"];
    }
    return self;
}

#pragma mark -- lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
    [self getNewsList];
}

#pragma mark -- UI
- (void)setUpUI {
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.newsTab];
}

- (void)layOutUI {
}

#pragma mark -- NetWork
- (void)getNewsList {
    self.listLoader = [[ZJNewsListLoader alloc]init];

    __weak typeof(self) weakSelf = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<ZJNewsListModel *> *_Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.dataArray = dataArray;
        [strongSelf.newsTab reloadData];
    }];
}

#pragma mark -- TableViewDelegate & DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ZJNewsItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    ZJNewsItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    cell.delegate = self;
//    [cell setUIData];

    [cell setCellDataWithModel:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJNewsListModel *modelItem = [self.dataArray objectAtIndex:indexPath.row];
    
    //target-action方案
    __kindof UIViewController *vc = [ZJMediator detailViewControllerWithUrl:modelItem.url];
    vc.title = [NSString stringWithFormat:@"序号%ld", (long)indexPath.row];
    
    
    [self.navigationController pushViewController:vc animated:YES];

//    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:modelItem.uniKey];//已读
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

#pragma mark -- 自定义协议实现回调
- (void)tableViewCell:(UITableViewCell *)cell clickBtn:(UIButton *)btn {
    NSLog(@"自定义协议的回调");
    ZJNewsDeleteView *deleteView = [[ZJNewsDeleteView alloc]initWithFrame:self.view.bounds];
    CGRect rect = [cell convertRect:btn.frame toView:nil]; //rect坐标转换，nil代表以window坐标为基准

    __weak typeof(self) weakSelf = self;
    [deleteView showDeleteViewFromPoint:rect.origin withBlock:^{
//           NSLog(@"1");
//           __strong typeof(self) strongSelf = weakSelf;
////           [strongSelf.dataArray removeLastObject];
//           [strongSelf.newsTab deleteRowsAtIndexPaths:@[[strongSelf.newsTab indexPathForCell:cell]] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    //通过delegate回调，得到了btn坐标
    //block回调，执行了删除函数
}

#pragma mark -- LazyLoad

- (UITableView *)newsTab {
    if (!_newsTab) {
        UITableView *view = [[UITableView alloc]initWithFrame:self.view.bounds];
        view = [[UITableView alloc]initWithFrame:self.view.bounds];
        view.delegate = self;
        view.dataSource = self;
        //注册cell
        [view registerClass:[ZJNewsItemCell class] forCellReuseIdentifier:@"id"];

        _newsTab = view;
    }
    return _newsTab;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
