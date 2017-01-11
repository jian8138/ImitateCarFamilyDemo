//
//  CarNewestTableViewController.h
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarNewestTableViewController : UITableViewController
- initWithType:(NewsType)type;
@property(nonatomic, assign)NewsType newsType;
@end
