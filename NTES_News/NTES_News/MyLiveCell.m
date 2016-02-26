

//
//  MyLiveCell.m
//  NTES_news
//
//  Created by Detailscool on 16/2/11.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyLiveCell.h"
#import "MyNews.h"
#import "UIImageView+WebCache.h"

@interface MyLiveCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *digestLable;

@end


@implementation MyLiveCell


- (void)setNewsModel:(MyNews *)newsModel {
    _newsModel = newsModel;
    
    self.titleLable.text = newsModel.title;
    
    self.digestLable.text = newsModel.digest;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil options:3];
    
}


@end
