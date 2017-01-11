//
//  ImgOnlyTopCellType.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ImgOnlyTopCellType.h"

@implementation ImgOnlyTopCellType

-(UIImageView *)displayImgView{
    if (!_displayImgView) {
        _displayImgView = [UIImageView new];
        _displayImgView.contentMode = UIViewContentModeScaleAspectFill;
        _displayImgView.layer.contentsRect = CGRectMake(0, -0.1, 1, 0.6);
        [self.contentView addSubview:_displayImgView];
        [_displayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.bottom.equalTo(0);
        }];
    }
    return _displayImgView;
}

-(UILabel *)advLabel{
    if (!_advLabel) {
        _advLabel = [UILabel new];
        _advLabel.font = [UIFont systemFontOfSize:8];
        _advLabel.textColor = [UIColor whiteColor];
        _advLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.displayImgView addSubview:_advLabel];
        [_advLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(2);
            make.bottom.equalTo(-2);
        }];
    }
    return _advLabel;
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
