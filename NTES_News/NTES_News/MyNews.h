//
//  MyNews.h
//  NTES_news
//
//  Created by Detailscool on 16/2/11.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNews : NSObject

@property (nonatomic,copy)NSString * title;

@property (nonatomic,copy)NSString * digest;

@property (nonatomic,copy)NSString * imgsrc;

@property (nonatomic,strong)NSArray * imgextra;

@property (nonatomic,copy)NSString * live_info;

//+ (instancetype) newsWithDictionary:(NSDictionary *)dict;

//+ (NSArray *)properties;

@end
