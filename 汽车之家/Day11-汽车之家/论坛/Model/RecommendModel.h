//
//  RecommendModel.h
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RecommendResultModel,RecommendListArrayModel;

@interface RecommendModel : NSObject

@property RecommendResultModel* result;

@end

@interface RecommendResultModel : NSObject

@property NSArray<RecommendListArrayModel*>* list;

@end

@interface RecommendListArrayModel : NSObject

@property NSString *categoryColour;
@property NSString *categoryid;
@property NSString *categoryname;

@end
