//
//  ThreePicCell.h
//  Day11-汽车之家
//
//  Created by tarena on 16/11/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreePicCell : UITableViewCell
@property (nonatomic) NSArray<UIImageView *> *icons;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *timeLb;
@property (nonatomic) UILabel *countLb;
@end
