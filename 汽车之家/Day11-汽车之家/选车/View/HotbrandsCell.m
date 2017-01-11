//
//  HotbrandsCell.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HotbrandsCell.h"

@implementation HotbrandsCell

-(NSMutableArray<UIView *> *)allViews
{
    if (!_allViews)
    {
        _allViews = [NSMutableArray array];
        CGFloat width =(long)([UIScreen mainScreen].bounds.size.width/5.0);
        for (NSInteger i = 0; i < 10; i ++)
        {
            UIView *view = [[UIView alloc]init];
            [self.contentView addSubview:view];
            CGFloat left = width * (i % 5);
            CGFloat top = width*(i / 5);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.equalTo(width);
                make.left.equalTo(left);
                make.top.equalTo(top);
                if(i > 4) make.bottom.equalTo(0);
            }];
            [_allViews addObject:view];
        }
    }
    return _allViews;
}

-(NSMutableArray<UIImageView *> *)iconIVs
{
    if (!_iconIVs)
    {
        _iconIVs = [NSMutableArray array];
        CGFloat width = (long)([UIScreen mainScreen].bounds.size.width/5.0) - 20;
        for (NSInteger i = 0; i < self.allViews.count; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]init];
            [self.allViews[i] addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(0);
                make.left.equalTo(10);
                make.width.height.equalTo(width);
            }];
            [_iconIVs addObject:imageView];
        }
    }
    return _iconIVs;
}

-(NSMutableArray<UILabel *> *)nameLBs
{
    if (!_nameLBs)
    {
        _nameLBs = [NSMutableArray array];
        for (NSInteger i = 0; i < self.allViews.count; i++)
        {
            UILabel *label = [[UILabel alloc]init];
            label.font = [UIFont systemFontOfSize:13];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            CGFloat width = (long)([UIScreen mainScreen].bounds.size.width/5.0) - 20;
            [self.allViews[i] addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.iconIVs[i].mas_bottom);
                make.left.equalTo(10);
                make.height.equalTo(20);
                make.width.equalTo(width);
            }];
            [_nameLBs addObject:label];
        }
    }
    return _nameLBs;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
