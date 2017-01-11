//
//  NetManager.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"
#define kCarPath @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt%ld-p%ld-s30-l%@.json"
@implementation NetManager
+ (id)getCarWithType:(NewsType)type lastTime:(NSString *)lasttime completionHander:(void(^)(CarNewestModel *model, NSError *error))completionHandler{
    lasttime = (lasttime == nil || lasttime == 0 || [lasttime  isEqualToString: @"0"]) ? @"0" : lasttime;
    NSString *path;
    switch (type) {
        case NewsTypeCarTech:
            path = kJiShuPath;
            break;
        case NewsTypeCarGuide:
            path = kDaoGouPath;
            break;
        case NewsTypeCarComment:
            path = kPingCePath;
            break;
        case NewsTypeCarTravel:
            path = kYouJiPath;
            break;
        case NewsTypeCarNews:
            path = kXinWenPath;
            break;
        case NewsTypeCarCulture:
            path = kWenHuaPath;
            break;
        case NewsTypeCarNewest:
            path = kZuiXinPath;
            break;
        case NewsTypeCarUse:
            path = kYongChePath;
            break;
        case NewsTypeCarPrice:
            path = kHangQingPath;
            break;
        case NewsTypeCarRefit:
            path = kGaiZhuangPath;
            break;
        default:
            break;
    }

    switch (type) {
        case 0:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p2-s30-l%@.json";
            break;
        case 1:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p1-s30-l%@.json";
            break;
        case 2:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p1-s30-l%@.json";
            break;
        case 3:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p1-s30-l%@.json";
            break;
        case 4:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c110100-nt2-p1-s30-l%@.json";
            break;
        case 5:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p1-s30-l%@.json";
            break;
        case 6:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p1-s30-l%@.json";
            break;
        case 7:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p1-s30-l%@.json";
            break;
        case 8:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p1-s30-l%@.json";
            break;
        case 9:
            path = @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p1-s30-l%@.json";
            break;
        default:
            break;
    }
    path = [NSString stringWithFormat:path, lasttime];
    return [self GET:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CarNewestModel parse:responseObj], nil);
    }];
}
//#pragma mark - 最新
//+ getNewestWithNt:(NSInteger)nt page:(NSInteger)page lastTime:(NSString *)lasttime completionHander:(void (^)(CarNewestModel *, NSError *))completionHandler{
////    lasttime = (lasttime == nil || lasttime == 0 || [lasttime  isEqual: @"0"]) ? @"0" : lasttime;
//    NSString *path = [NSString stringWithFormat:kCarPath, nt, page, lasttime];
//    return [self GET:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
//        !completionHandler ?: completionHandler([CarNewestModel parse:responseObj], nil);
//    }];
//}
//#pragma mark - 新闻
//+ getNewsWithNt:(NSInteger)nt page:(NSInteger)page lastTime:(NSString *)lasttime completionHander:(void (^)(CarNewsModel *, NSError *))completionHandler{
//    //    lasttime = (lasttime == nil || lasttime == 0 || [lasttime  isEqual: @"0"]) ? @"0" : lasttime;
//    NSString *path = [NSString stringWithFormat:kCarPath, nt, page, lasttime];
//    return [self GET:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
//        !completionHandler ?: completionHandler([CarCommentModel parse:responseObj], nil);
//    }];
//}
//#pragma mark - 评测
//+ getCommentWithNt:(NSInteger)nt page:(NSInteger)page lastTime:(NSString *)lasttime completionHander:(void (^)(CarCommentModel *, NSError *))completionHandler{
////    lasttime = (lasttime == nil || lasttime == 0 || [lasttime  isEqual: @"0"]) ? @"0" : lasttime;
//    NSString *path = [NSString stringWithFormat:kCarPath, nt, page, lasttime];
//    return [self GET:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
//        !completionHandler ?: completionHandler([CarCommentModel parse:responseObj], nil);
//    }];
//}
@end
