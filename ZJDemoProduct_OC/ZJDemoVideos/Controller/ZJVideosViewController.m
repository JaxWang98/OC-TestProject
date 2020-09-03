//
//  ZJVideosViewController.m
//  ZJDemoProduct_OC
//
//  Created by jaxwang on 2020/7/15.
//  Copyright © 2020 widerness. All rights reserved.
//

#import "ZJVideosViewController.h"
#import "ZJVideoCoverCell.h"

@interface ZJVideosViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ZJVideosViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"video"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected"];

        
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

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJVideoCoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"videoCellID" forIndexPath:indexPath];
    if ([cell isKindOfClass:[ZJVideoCoverCell class]]) {
        [cell setUpCellWithVideoCoverUrl:@"videoCover" andVideoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
//        [cell setUpCellWithVideoCoverUrl:@"videoCover" andVideoUrl:@"https://www.bilibili.com/video/BV1vK4y1Y7su"];

         
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}



#pragma mark -- LazyLoad
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.itemSize = CGSizeMake((self.view.bounds.size.width - 10), (self.view.bounds.size.width - 10) / 16 * 9);
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];

        collectionView.backgroundColor = [UIColor blackColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;

        //cell注册
        [collectionView registerClass:[ZJVideoCoverCell class] forCellWithReuseIdentifier:@"videoCellID"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

@end
