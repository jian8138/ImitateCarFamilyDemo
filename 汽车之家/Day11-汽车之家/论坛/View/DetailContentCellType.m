//
//  DetailContentCellType.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "DetailContentCellType.h"

@implementation DetailContentCellType

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 2;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.right.equalTo(self.replyCountLabel);
            
        }];
    }
    return _titleLabel;
}

-(UILabel *)forumNameLabel{
    if (!_forumNameLabel) {
        _forumNameLabel = [UILabel new];
        _forumNameLabel.numberOfLines = 1;
        _forumNameLabel.font = [UIFont systemFontOfSize:12];
        _forumNameLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_forumNameLabel];
        [_forumNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
        }];
    }
    return _forumNameLabel;
}

-(UILabel *)replyCountLabel{
    if (!_replyCountLabel) {
        _replyCountLabel = [UILabel new];
        _replyCountLabel.numberOfLines = 1;
        _replyCountLabel.textAlignment = NSTextAlignmentCenter;
        _replyCountLabel.font = [UIFont systemFontOfSize:12];
        _replyCountLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_replyCountLabel];
        [_replyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.iconImgView.mas_left).offset(-10);
            make.bottom.equalTo(-10);
        }];
    }
    return _replyCountLabel;
}

-(UIImageView *)iconImgView{
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        [self.contentView addSubview:_iconImgView];
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.right.bottom.equalTo(-10);
            make.width.equalTo(self.contentView).multipliedBy(0.27);
        }];
    }
    return _iconImgView;
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
