//
//  NSString+URL.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

-(NSURL *)ry_url{
    return [NSURL URLWithString:self];
}

@end
