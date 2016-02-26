//
//  CZHTTPManager.h
//  09News
//
//  Created by gzxzmac on 16/2/26.
//  Copyright © 2016年 gzxzmac. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface CZHTTPManager : AFHTTPSessionManager
+ (instancetype)sharedManager;


@end
