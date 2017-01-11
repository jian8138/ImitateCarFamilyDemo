//
//  AdvertCell.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AdvertCell.h"

@implementation AdvertCell

-(NSMutableArray<UIImageView *> *)iconIV
{
    if (!_iconIV)
    {
        _iconIV = [NSMutableArray array];
        CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 60)/3.0);
        CGFloat height = width * 160 /240.0;
        for (NSInteger i = 0; i < 3; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]init];
            CGFloat left = (width + 15 )*i + 15;
            [self.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(left);
                make.width.equalTo(width);
                make.height.equalTo(height);
                make.top.equalTo(10);
            }];
            [_iconIV addObject:imageView];
        }
    }
    return _iconIV;
}

-(NSMutableArray<UILabel *> *)nameLB
{
    if (!_nameLB)
    {
        _nameLB = [NSMutableArray array];
        for (NSInteger i = 0; i < self.iconIV.count; i++)
        {
            UILabel *label = [[UILabel alloc]init];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:14];
            [self.contentView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.iconIV[i].mas_bottom).offset(10);
                make.height.equalTo(20);
                make.left.right.equalTo(self.iconIV[i]);
                make.bottom.equalTo(-10);
            }];
            [_nameLB addObject:label];
        }
    }
    return _nameLB;
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
