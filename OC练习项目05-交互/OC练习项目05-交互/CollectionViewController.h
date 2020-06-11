//
//  CollectionViewController.h
//  OC练习项目04-TableView
//
//  Created by EHI on 2020/6/9.
//  Copyright © 2020 EHI. All rights reserved.
//
/*
    UICollectionView
        与tableViewyou相同的api设计理念--基于dataSource 和 delegate
        相似
            row --> item
            dataSource
            Delegate
        区别
            不提供默认样式
                不是行
            必须先进行注册来复用
    UICollectionViewLayout
        用于生成UICollectionView布局的抽象类
        UIColletionViewFLowLayout 流布局
            流布局原理是根据下面几个属性来计算1个行能放几个item
            minimumLineSpacing 行间
            mininmumIngeriteSpacing 行内最小距离 注意是最小
            itemSize
 
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
