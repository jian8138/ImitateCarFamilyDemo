//
//  ForumNetManager.h
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ForumDataModel.h"
#import "RecommendModel.h"

@interface ForumNetManager : BaseNetManager

+(id)getForumNetManagerWithPagesIndex:(NSInteger)index andCompletionHandler:(void(^)(ForumDataModel *model,NSError* error))completionHandler;

+(id)getForumRecommendModelWithCompletionHandler:(void(^)(RecommendModel* model, NSError* error))completionHandler;

@end
