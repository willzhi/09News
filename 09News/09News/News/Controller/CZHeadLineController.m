//
//  CZHeadLineController.m
//  09News
//
//  Created by gzxzmac on 16/2/26.
//  Copyright © 2016年 gzxzmac. All rights reserved.
//

#import "CZHeadLineController.h"
#import "CZHeadLineCell.h"
@interface CZHeadLineController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation CZHeadLineController

static NSString * const reuseIdentifier = @"HeadLine";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
   
}

/**
 *  设置view的布局以及其他的样式
 */
- (void)setupView {
    // 设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 设置item 大小
    self.layout.itemSize = self.collectionView.bounds.size;
    // 滚动方向
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 隐藏滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 设置间隔
    self.layout.minimumLineSpacing = 0;
    // 设置分页
    self.collectionView.pagingEnabled = YES;
    // 关闭弹簧
    self.collectionView.bounces = NO;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CZHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 设置背景色
   cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}


@end
