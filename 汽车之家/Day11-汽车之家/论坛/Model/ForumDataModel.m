//
//  ForumDataModel.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ForumDataModel.h"

@implementation ForumDataModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result":[ForumDataResultModel class]};
}

@end

@implementation ForumDataResultModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[ForumResultListModel class]};
}

@end

@implementation ForumResultListModel



@end
