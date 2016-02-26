//
//  MyImageNewsCell.m
//  NTES_news
//
//  Created by Detailscool on 16/2/11.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyImageNewsCell.h"
#import "MyNews.h"
#import "UIImageView+WebCache.h"
#import "MyImageNews.h"
@interface MyImageNewsCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconVIew1;
@property (weak, nonatomic) IBOutlet UIImageView *iconVIew2;
@property (weak, nonatomic) IBOutlet UIImageView *iconVIew3;

@end

@implementation MyImageNewsCell

- (void)setNewsModel:(MyNews *)newsModel {
    _newsModel = newsModel;
    
    self.titleLabel.text = newsModel.title;
    
//    NSLog(@"%@,%@",newsModel.title,NSStringFromCGRect(self.titleLabel.frame));
    
    [self.iconVIew1 sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil options:3];

    NSArray * arr = newsModel.imgextra;

    [self.iconVIew2 sd_setImageWithURL:[NSURL URLWithString:[[arr firstObject] imgsrc]] placeholderImage:nil options:3];
    
//    NSLog(@"%@,%@",NSStringFromCGRect(self.iconVIew1.frame),NSStringFromCGRect(self.iconVIew2.frame));

    [self.iconVIew3 sd_setImageWithURL:[NSURL URLWithString:[[arr lastObject] imgsrc]] placeholderImage:nil options:3];

}

@end
