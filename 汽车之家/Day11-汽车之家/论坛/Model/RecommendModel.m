//
//  RecommendModel.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result":[RecommendResultModel class]};
}

@end

@implementation RecommendResultModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[RecommendListArrayModel class]};
}

@end

@implementation RecommendListArrayModel


@end
