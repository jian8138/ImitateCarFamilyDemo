//
//  LiuNanLIshi.m
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/11/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiuNanLIshi.h"

@interface LiuNanLIshi ()

@end

@implementation LiuNanLIshi

- (id)initWithNSString:(NSString *)str
{
    if (self = [super init]) {
        _str = str;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


-(NSArray<NSString *> *)titles
{
    return @[@"车系",@"车型",@"口碑",@"文章",@"创优 +",@"视频",@"说客",@"论坛",@"帖子",@"其他"];
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}

-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    UIViewController *vc = [UIViewController new];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic_empty"]];
    [vc.view addSubview:image];
    image.contentMode = UIViewContentModeScaleAspectFill;
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(-55);
        make.centerX.equalTo(0);
    }];
    
    UILabel *label = [UILabel new];
    [vc.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(image.mas_bottom).offset(5);
        make.centerX.equalTo(0);
    }];
    label.text = @"暂无收藏车系";
    label.font = [UIFont systemFontOfSize:17];
    
    self.navigationItem.title = _str;
    [NSObject getToVC:self];
    
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleColorNormal = [UIColor lightGrayColor];
    self.titleColorSelected = [UIColor blackColor];
    self.progressWidth = 38;
    
    return vc;
}



@end
