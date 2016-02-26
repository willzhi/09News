//
//  CZApiManager.m
//  09News
//
//  Created by gzxzmac on 16/2/26.
//  Copyright © 2016年 gzxzmac. All rights reserved.
//

#import "CZApiManager.h"
#import "CZHTTPManager.h"
@implementation CZApiManager
+ (instancetype)sharedApi {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)requestHeadLineDataWithURL:(NSString *)url success:(void (^)(id))success error:(void (^)(NSError *))error {
    [[CZHTTPManager sharedManager]GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errorInfo) {
        if (error) {
            error(errorInfo);
        }
    }];
}
@end
