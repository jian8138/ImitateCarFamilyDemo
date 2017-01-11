//
//  ShiZhiCell.h
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShiZhiCell : UITableViewCell

@property(nonatomic)UILabel *titleLb;

@property(nonatomic)NSArray <UIButton *> *ZhiTi;

@property(nonatomic)UILabel *ContentLb;
//哪个开关
@property(nonatomic)UISwitch *Switch;

@property(nonatomic)UILabel *jianjieLb;

@end
