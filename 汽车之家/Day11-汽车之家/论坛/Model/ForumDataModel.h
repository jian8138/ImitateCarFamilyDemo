//
//  ForumDataModel.h
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForumDataResultModel,ForumResultListModel;
@interface ForumDataModel : NSObject

@property (nonatomic, strong) ForumDataResultModel * result;

@end

@interface ForumDataResultModel : NSObject

@property (nonatomic, strong) NSArray<ForumResultListModel*> * list;
@property (nonatomic, assign) NSInteger pagecount;
@property (nonatomic, assign) NSInteger pageindex;
@property (nonatomic, assign) NSInteger rowcount;
@property (nonatomic, assign) NSInteger updatecount;

@end

@interface ForumResultListModel : NSObject

@property (nonatomic, assign) NSInteger bbsid;
@property (nonatomic, strong) NSString * bbsname;
@property (nonatomic, strong) NSString * bbstype;
@property (nonatomic, strong) NSString * bigpic;
@property (nonatomic, strong) NSString * imgurl;
@property (nonatomic, assign) NSInteger isclosed;
@property (nonatomic, strong) NSString * lastreplydate;
@property (nonatomic, assign) NSInteger postmemberid;
@property (nonatomic, strong) NSString * postusername;
@property (nonatomic, strong) NSString * pvid;
@property (nonatomic, strong) NSString * replycounts;
@property (nonatomic, strong) NSString * smallpic;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger topicid;
@property (nonatomic, strong) NSString * topictype;
@property (nonatomic, assign) NSInteger views;

@end
