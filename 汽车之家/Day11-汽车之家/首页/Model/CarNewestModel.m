//
//  CarNewestModel.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CarNewestModel.h"

@implementation CarNewestModel

@end

@implementation CarNewestResultModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"focusimg":@"CarNewestResultFocusModel",@"newslist":@"CarNewestResultListModel"};
}
@end

@implementation CarNewestResultFocusModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"idField":@"id"};
}
@end

@implementation CarNewestResultListModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"idField":@"id"};
}
@end
