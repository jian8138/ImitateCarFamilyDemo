//
//  NSObject+TR.m
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/12/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSObject+TR.h"

@implementation NSObject (TR)

+ (void)getToVC:(UIViewController *)vc
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"nav_icon_back"] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    vc.navigationItem.leftBarButtonItem = item;
}

@end
