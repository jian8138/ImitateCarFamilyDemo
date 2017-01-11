//
//  NSString+RM.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+RM.h"

@implementation NSString (RM)
- (NSURL *)rm_URL{
    return [NSURL URLWithString:self];
}
@end
