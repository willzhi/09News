//
//  NSObject+Extension.m
//  百思不得姐
//
//  Created by Detailscool on 16/2/19.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "NSObject+Extension.h"
#import "YYModel.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

+ (instancetype)objectWithDictionary:(NSDictionary *)dict
{
    return [self yy_modelWithJSON:dict];
}

//+ (instancetype)objectWithDictionary:(NSDictionary *)dict
//{
//    id obj = [[self alloc]init];
//    
//    NSArray * properties = [self properties];
//    
//    for (NSString * property in properties) {
//        if (dict[property]) {
//            [obj setValue:dict[property] forKey:property];
//        }
//    }
//    
//    return obj;
//}


+ (NSArray *)objectArrayWithArray:(NSArray <NSDictionary *>*)arr {
    
    NSMutableArray * mtbArr = [NSMutableArray array];
    
    for (NSDictionary * dict in arr) {
        
        id obj = [self objectWithDictionary:dict];
        
        if (obj) {
            [mtbArr addObject:obj];
        }
    }
    
    return mtbArr.copy;
    
}

//+ (NSArray *)objectArrayWithArray:(NSArray <NSDictionary *>*)arr {
//    return [NSArray yy_modelArrayWithClass:[self class] json:arr];
//}

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
    
    free(properties);
    
    return arr.copy;
}

+ (NSArray *)ivars {
    
    NSMutableArray * arr = [NSMutableArray array];
    
    unsigned int outCount = 0;
    
    //获得成员变量数组
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        //获得每一个属性
        Ivar ivar = ivars[i];
        //获得属性名字
        const char * cname = ivar_getName(ivar);
        //转换成OC字符串
        NSString * nameStr = [NSString stringWithCString:cname encoding:NSUTF8StringEncoding];
        
        [arr addObject:nameStr];
        
    }
    
    free(ivars);
    
    return arr.copy;

}

@end
