//
//  ForumNetManager.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ForumNetManager.h"

#define forumPath @"http://clubnc.app.autohome.com.cn/club_v7.0.5/club/jingxuantopic.ashx?platud=1&categoryid=0&pageindex=%ld&pagesize=30&devicetype=ios.iPhone&deviceid=7465447a3a970b461f1074c8e3166b88a4cd7c1a&userid=0&operation=0&netstate=0&gps=22.642408,114.203636"

#define forumRecommend @"http://club.app.autohome.com.cn/club_v7.0.5/club/jingxuantype-pm1.json"

@implementation ForumNetManager

+(id)getForumNetManagerWithPagesIndex:(NSInteger)index andCompletionHandler:(void (^)(ForumDataModel *, NSError *))completionHandler{
    NSString *pathToGo = [NSString stringWithFormat:forumPath,index];
    return [self GET:pathToGo parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler ([ForumDataModel parse:responseObj],error);
    }];
}

+(id)getForumRecommendModelWithCompletionHandler:(void (^)(RecommendModel *, NSError *))completionHandler{
    return [self GET:forumRecommend parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler ([RecommendModel parse:responseObj],error);
    }];
}

@end
