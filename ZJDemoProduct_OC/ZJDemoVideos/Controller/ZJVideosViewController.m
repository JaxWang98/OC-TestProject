//
//  ZJVideosViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJVideosViewController.h"



@interface ZJVideosViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ZJVideosViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_main_rocket"];
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
    [self.view addSubview:self.collectionView];

}

- (void)layOutUI {
}


#pragma mark -- UIcollectionViewDelegate & DataSource

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 100;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item %3 == 0) {
        return CGSizeMake(self.view.bounds.size.width, 300);
    }
    else{
        return CGSizeMake((self.view.bounds.size.width -10)/2, 300);
    }
}


#pragma mark -- LazyLoad
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.itemSize = CGSizeMake((self.view.bounds.size.width - 10) / 2, 300);
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        //cell注册
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewID"];
        _collectionView = collectionView;
    }
    return _collectionView;
}


@end
