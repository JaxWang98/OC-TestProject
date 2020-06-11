//
//  CollectionViewController.m
//  OC练习项目04-TableView
//
//  Created by EHI on 2020/6/9.
//  Copyright © 2020 EHI. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CollectionViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing =10;
    flowLayout.itemSize = CGSizeMake((self.view.bounds.size.width -10)/2, 300);
    UICollectionView *myCollectView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    myCollectView.backgroundColor = [UIColor whiteColor];
    myCollectView.dataSource = self;
    myCollectView.delegate = self;
    
    //cell注册
    [myCollectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewID"];
    
    [self.view addSubview:myCollectView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item %3 == 0) {
        return CGSizeMake(self.view.bounds.size.width, 300);
    }
    else{
        return CGSizeMake((self.view.bounds.size.width -10)/2, 300);
    }
}

@end
