//
//  UIView+HUD.h
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
//让视图弹出提示
- (void)showMsg:(NSString *)msg;

//显示繁忙
- (void)showBusy;
- (void)hideBusy;
@end
