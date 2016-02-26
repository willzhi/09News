//
//  CZHTTPManager.m
//  09News
//
//  Created by gzxzmac on 16/2/26.
//  Copyright © 2016年 gzxzmac. All rights reserved.
//

#import "CZHTTPManager.h"
#define CZBaseURL [NSURL URLWithString:@"http://c.m.163.com/nc/"]
@implementation CZHTTPManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static CZHTTPManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:CZBaseURL sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return instance;
}

@end
