//
//  XuanCheNetManager.h
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XuanCheBaseNetManager.h"
#import "BrandsDetailModel.h"

@interface XuanCheNetManager : XuanCheBaseNetManager

+(id)getXuanCheListDataWithType:(NSInteger)type CompletionHandler:(void(^)(XuanCheDataModel *model,NSError *error)) completionHandler;

+(id)getBrandsDetailWithValue:(NSString*)value CompletionHandler:(void(^)(BrandsDetailModel *model,NSError *error)) completionHandler;

+(NSArray*)createFakeHotbrands;

+(NSArray*)createFakeAdvert;

@end
