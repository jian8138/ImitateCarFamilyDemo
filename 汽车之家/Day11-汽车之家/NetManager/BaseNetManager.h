//
//  BaseNetManager.h
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BaseNetManager : NSObject
+ (id)GET:(NSString *)path parameter:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameter:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;
@end
