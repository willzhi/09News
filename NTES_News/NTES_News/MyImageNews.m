//
//  MyImageNews.m
//  NTES_news
//
//  Created by Detailscool on 16/2/11.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "MyImageNews.h"
#import <objc/runtime.h>

@implementation MyImageNews

+ (instancetype) imageNewsWithDictionary:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    
    NSArray * properties = [self properties];
    
    for (NSString * property in properties) {
        if (dict[property]) {
            [obj setValue:dict[property] forKey:property];
        }
    }
    
    return obj;
}


+ (NSArray *)properties {
    
    NSMutableArray * arr = [NSMutableArray array];
    
    unsigned int outCount = 0;
    
    //获得属性数组
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        //获得每一个属性
        objc_property_t property = properties[i];
        //获得属性名字
        const char * cname = property_getName(property);
        //转换成OC字符串
        NSString * nameStr = [NSString stringWithCString:cname encoding:NSUTF8StringEncoding];
        
        [arr addObject:nameStr];
        
    }
    
    return arr;
}

@end
