//
//  ThreePicCell.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ThreePicCell.h"

@implementation ThreePicCell

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        _titleLb.numberOfLines = 0;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(15);
            make.right.equalTo(-15);
        }];
    }
    return _titleLb;
}
- (NSArray<UIImageView *> *)icons{
    if (!_icons) {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (int i = 0; i < 3; i++) {
            UIImageView *iconIV = [UIImageView new];
            [self.contentView addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLb.mas_bottom).offset(3);
                if (i == 0) {
                    make.left.equalTo(15);
                    make.width.equalTo(self.contentView.mas_width).multipliedBy(280 / (320.0 * 3));
                    make.height.equalTo(self.contentView.mas_width).multipliedBy(105 / 640.0);
                }else{
                    make.left.equalTo(lastView.mas_right).offset(5);
                    make.size.equalTo(lastView);
                    if (i == 2) {
                        make.right.equalTo(-15);
                    }
                }
            }];
            lastView = iconIV;
            [tmpArr addObject:iconIV];
        }
        _icons = tmpArr.copy;
    }
    return _icons;
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
            make.top.equalTo(self.icons.firstObject.mas_bottom).offset(8);
            make.bottom.equalTo(-9);
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
            make.top.bottom.equalTo(self.countLb);
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
