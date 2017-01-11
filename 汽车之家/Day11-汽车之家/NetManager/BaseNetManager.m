//
//  BaseNetManager.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+ (id)GET:(NSString *)path parameter:(NSDictionary *)params completionHandler:(void (^)(id, NSError *))completionHandler{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.rm_URL];
    NSLog(@"path %@",path);
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json",@"charset=utf-8",nil];
    manager.requestSerializer.timeoutInterval = 30;
    
    return [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        !completionHandler ?: completionHandler(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameter:(NSDictionary *)params completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json",@"charset=utf-8", nil];
    manager.requestSerializer.timeoutInterval = 30;
    
    return [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        !completionHandler ?: completionHandler(nil, error);
    }];
}
@end
