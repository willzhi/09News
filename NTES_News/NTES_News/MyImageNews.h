//
//  MyImageNews.h
//  NTES_news
//
//  Created by Detailscool on 16/2/11.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyImageNews : NSObject

@property (nonatomic,copy)NSString * imgsrc;

+ (instancetype) imageNewsWithDictionary:(NSDictionary *)dict;

@end
