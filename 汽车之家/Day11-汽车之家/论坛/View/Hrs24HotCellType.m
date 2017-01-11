//
//  Hrs24HotCellType.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Hrs24HotCellType.h"

@implementation Hrs24HotCellType



-(UILabel *)hotLabel{
    if (!_hotLabel) {
        _hotLabel = [UILabel new];
        [self.contentView addSubview:_hotLabel];
        [_hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.hotImgView.mas_right).offset(10);
            make.centerY.equalTo(0);
        }];
    }
    return _hotLabel;
}

-(UIImageView *)hotImgView{
    if (!_hotImgView) {
        _hotImgView = [UIImageView new];
        [self.contentView addSubview:_hotImgView];
        [_hotImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
    }
    return _hotImgView;
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
