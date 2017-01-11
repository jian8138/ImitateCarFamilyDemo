//
//  NetManager.h
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "CarNewestModel.h"
//如果不同的请求返回值结构是一样的，则可以合并为一个请求方法
typedef NS_ENUM(NSUInteger, NewsType){
    NewsTypeCarNewest,
    NewsTypeCarNews,
    NewsTypeCarComment,
    NewsTypeCarGuide,
    NewsTypeCarPrice,
    NewsTypeCarUse,
    NewsTypeCarTech,
    NewsTypeCarCulture,
    NewsTypeCarRefit,
    NewsTypeCarTravel,
};
@interface NetManager : BaseNetManager

+ (id)getCarWithType:(NewsType)type lastTime:(NSString *)lasttime completionHander:(void(^)(CarNewestModel *model, NSError *error))completionHandler;
@end
