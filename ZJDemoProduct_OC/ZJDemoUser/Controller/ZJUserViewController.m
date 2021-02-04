//
//  ZJUserViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJUserViewController.h"
#import "ZJScreenDefines.h"
#import <Masonry/Masonry.h>

@interface ZJUserViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) NSArray<NSString *> *userStrList;
@end

@implementation ZJUserViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

#pragma mark -- UI
- (void)setUpUI {
    self.view.backgroundColor = UIColor.greenColor;
    [self.view addSubview:self.tableView];
    [self layOutUI];
}

- (void)layOutUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
}


#pragma mark -- UItableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AutoUI(60);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    if (self.userStrList.count > 0 ) {
        cell.textLabel.text =  [self.userStrList objectAtIndex:indexPath.row];
    }else {
        cell.textLabel.text = @"空白";
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userStrList.count >0 ?self.userStrList.count : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AutoUI(150);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -- LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] init];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"userCell"];
        _tableView = tableView;
    }
    return _tableView;
}
- (UIView *)headerView {
    if (!_headerView) {
        UIView *view  = [[UIView alloc] init];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
        [view addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.height.mas_equalTo(AutoUI(120));
        }];
        
        _headerView = view;
    }
    return _headerView;
}
- (NSArray<NSString *> *)userStrList {
    if (!_userStrList) {
        _userStrList = @[@"昵称",@"性别",@"手机号"];
    }
    return _userStrList;
}

@end
