//
//  MyLabel.m
//  NewsWithDoubleScrollView
//
//  Created by Detailscool on 16/2/15.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor =[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
        self.userInteractionEnabled = YES;
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

- (void)setScale:(CGFloat)scale {

    _scale = scale;
    
    self.textColor = [UIColor colorWithRed:1 green:scale blue:scale alpha:1];
    self.transform = CGAffineTransformMakeScale(1+0.3*(1 - scale), 1+0.3*(1 - scale));
}

@end
