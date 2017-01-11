//
//  ListCell.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

-(UIImageView *)iconIV
{
    if (!_iconIV)
    {
        _iconIV = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(34, 34));
            make.top.equalTo(5);
            make.left.equalTo(5);
            make.bottom.equalTo(-5);
        }];
    }
    return _iconIV;
}

-(UILabel *)nameLB
{
    if (!_nameLB)
    {
        _nameLB = [[UILabel alloc]init];
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).offset(18);
            make.centerY.equalTo(0);
        }];
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
