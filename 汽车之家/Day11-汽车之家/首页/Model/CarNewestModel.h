//
//  CarNewestModel.h
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CarNewestResultModel,CarNewestResultFocusModel,CarNewestResultListModel;
@interface CarNewestModel : NSObject
@property (nonatomic, strong) NSString * message;
@property(nonatomic)CarNewestResultModel *result;
@property (nonatomic, assign) NSInteger returncode;
@end

@interface CarNewestResultModel : NSObject
@property (nonatomic, assign) BOOL isloadmore;
@property (nonatomic, assign) NSInteger rowcount;
@property(nonatomic, strong)NSString *idField;
@property(nonatomic, strong)NSString *lasttime;
@property(nonatomic, assign)NSInteger replycount;
@property(nonatomic, strong)NSString *smallpic;
@property(nonatomic, strong)NSString *time;
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *type;

@property(nonatomic)NSArray<CarNewestResultFocusModel *> *focusimg;
@property(nonatomic)NSArray<CarNewestResultListModel *> *newslist;
@end

@interface CarNewestResultFocusModel : NSObject
@property (nonatomic) NSInteger fromtype;
@property (nonatomic) NSInteger idField;
@property (nonatomic) NSString *imgurl;
@property (nonatomic) NSInteger JumpType;
@property (nonatomic) NSString *jumpurl;
@property (nonatomic) NSInteger mediatype;
@property (nonatomic) NSInteger pageindex;
@property (nonatomic) NSInteger replycount;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *updatetime;
@end

@interface CarNewestResultListModel : NSObject
@property (nonatomic, strong) NSArray * coverimages;
@property (nonatomic, assign) NSInteger dbid;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * indexdetail;
@property (nonatomic, strong) NSString * intacttime;
@property (nonatomic, assign) NSInteger jumppage;
@property (nonatomic, strong) NSString * lasttime;
@property (nonatomic, assign) NSInteger mediatype;
@property (nonatomic, assign) NSInteger newstype;
@property (nonatomic, assign) NSInteger pagecount;
@property (nonatomic, assign) NSInteger replycount;
@property (nonatomic, strong) NSString * smallpic;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * updatetime;

@end
