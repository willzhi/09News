//
//  NSObject+Extension.h
//  百思不得姐
//
//  Created by Detailscool on 16/2/19.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *  根据字典创建对象（对应属性）
 *
 */
+ (instancetype)objectWithDictionary:(NSDictionary *)dict;

/**
 *  根据 字典数组 创建 对象数组（对应属性）
 */
+ (NSArray *) objectArrayWithArray:(NSArray <NSDictionary *>*)arr;

/**
 *  获取属性数组
 */
+ (NSArray *)properties;

/**
 *  获取成员变量数组
 */
+ (NSArray *)ivars;

@end
