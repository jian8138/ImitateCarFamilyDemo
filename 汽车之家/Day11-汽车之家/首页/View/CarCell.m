//
//  CarCell.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CarCell.h"

@implementation CarCell
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        _iconIV.contentMode = UIViewContentModeScaleToFill;
//        _iconIV.layer.cornerRadius = 4;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView.mas_width).multipliedBy(280 / (320.0 * 3));
            make.height.equalTo(self.contentView.mas_width).multipliedBy(105 / 640.0);
            make.right.equalTo(-15);
            make.top.equalTo(13);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        _titleLb.numberOfLines = 0;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(self.iconIV.mas_left).offset(-20);
            make.top.equalTo(self.iconIV);
        }];
    }
    return _titleLb;
}

- (UILabel *)countLb{
    if (!_countLb) {
        _countLb = [UILabel new];
        _countLb.font = [UIFont systemFontOfSize:14];
        _countLb.textAlignment = NSTextAlignmentRight;
        _countLb.textColor = [UIColor grayColor];
        [self.contentView addSubview:_countLb];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.top.bottom.equalTo(self.timeLb);
            make.top.greaterThanOrEqualTo(self.titleLb.mas_bottom).offset(10);
        }];
    }
    return _countLb;
}

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.font = [UIFont systemFontOfSize:14];
        _timeLb.textAlignment = NSTextAlignmentRight;
        _timeLb.textColor = [UIColor grayColor];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_bottom).offset(10);
            make.left.greaterThanOrEqualTo(self.countLb.mas_right).offset(10);
            make.bottom.equalTo(-10);
            make.right.equalTo(-15);
        }];
    }
    return _timeLb;
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
