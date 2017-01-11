//
//  RecommendCellType.m
//  Day11-汽车之家
//
//  Created by RAYMOND on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RecommendCellType.h"

@implementation RecommendCellType

-(UIColor*)borderBlueColor{
    return [UIColor colorWithRed:73/255.0 green:131/255.0 blue:245/255.0 alpha:1];
}

-(UIColor*)backgroundBlueColor{
    return [UIColor colorWithRed:245/255.0 green:246/255.0 blue:255/255.0 alpha:1];
}

-(UIColor*)borderOrangeColor{
    return [UIColor colorWithRed:242/255.0 green:157/255.0 blue:61/255.0 alpha:1];
}

-(UIColor*)backgroundOrangeColor{
    return [UIColor colorWithRed:255/255.0 green:249/255.0 blue:241/255.0 alpha:1];
}



-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(15);
        }];
        
    }
    return _titleLabel;
}

//242 157 61  //156 186 243
-(UIButton *)recommendDetailUIButton1{
    if (!_recommendDetailUIButton1) {
        _recommendDetailUIButton1 = [UIButton new];
        _recommendDetailUIButton1.layer.borderWidth = 1;
        _recommendDetailUIButton1.layer.cornerRadius = 2;
        _recommendDetailUIButton1.clipsToBounds = YES;
        [_recommendDetailUIButton1 setTitleColor:[self borderBlueColor] forState:UIControlStateNormal];
        _recommendDetailUIButton1.layer.borderColor = [self borderBlueColor].CGColor;
        _recommendDetailUIButton1.backgroundColor = [self backgroundBlueColor];
        _recommendDetailUIButton1.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton1];
        [_recommendDetailUIButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
            make.left.equalTo(self.titleLabel);
            make.left.equalTo(10);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.height.equalTo(30);
//            make.width.equalTo(90);
        }];
    }
    return _recommendDetailUIButton1;
}

-(UIButton *)recommendDetailUIButton2{
    if (!_recommendDetailUIButton2) {
        _recommendDetailUIButton2 = [UIButton new];
        
        _recommendDetailUIButton2.layer.borderWidth = 1;
        _recommendDetailUIButton2.layer.cornerRadius = 2;
        _recommendDetailUIButton2.clipsToBounds = YES;
        [_recommendDetailUIButton2 setTitleColor:[self borderBlueColor] forState:UIControlStateNormal];
        _recommendDetailUIButton2.layer.borderColor = [self borderBlueColor].CGColor;
        _recommendDetailUIButton2.backgroundColor = [self backgroundBlueColor];
        _recommendDetailUIButton2.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton2];
        [_recommendDetailUIButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommendDetailUIButton1.mas_right).offset(10);
            make.top.equalTo(self.recommendDetailUIButton1);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton2;
}

-(UIButton *)recommendDetailUIButton3{
    if (!_recommendDetailUIButton3) {
        _recommendDetailUIButton3 = [UIButton new];
        
        _recommendDetailUIButton3.layer.borderWidth = 1;
        _recommendDetailUIButton3.layer.cornerRadius = 2;
        _recommendDetailUIButton3.clipsToBounds = YES;
        [_recommendDetailUIButton3 setTitleColor:[self borderOrangeColor] forState:UIControlStateNormal];
        _recommendDetailUIButton3.layer.borderColor = [self borderOrangeColor].CGColor;
        _recommendDetailUIButton3.backgroundColor = [self backgroundOrangeColor];
        _recommendDetailUIButton3.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton3];
        [_recommendDetailUIButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommendDetailUIButton2.mas_right).offset(10);
            make.top.equalTo(self.recommendDetailUIButton1);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton3;
}

-(UIButton *)recommendDetailUIButton4{
    if (!_recommendDetailUIButton4) {
        _recommendDetailUIButton4 = [UIButton new];
        
        _recommendDetailUIButton4.layer.borderWidth = 1;
        _recommendDetailUIButton4.layer.cornerRadius = 2;
        _recommendDetailUIButton4.clipsToBounds = YES;
        [_recommendDetailUIButton4 setTitleColor:[self borderOrangeColor] forState:UIControlStateNormal];
        _recommendDetailUIButton4.layer.borderColor = [self borderOrangeColor].CGColor;
        _recommendDetailUIButton4.backgroundColor = [self backgroundOrangeColor];
        _recommendDetailUIButton4.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton4];
        [_recommendDetailUIButton4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommendDetailUIButton3.mas_right).offset(10);
            make.top.equalTo(self.recommendDetailUIButton1);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton4;
}

-(UIButton *)recommendDetailUIButton5{
    if (!_recommendDetailUIButton5) {
        _recommendDetailUIButton5 = [UIButton new];
        
        _recommendDetailUIButton5.layer.borderWidth = 1;
        _recommendDetailUIButton5.layer.cornerRadius = 2;
        _recommendDetailUIButton5.clipsToBounds = YES;
        [_recommendDetailUIButton5 setTitleColor:[self borderBlueColor] forState:UIControlStateNormal];
        _recommendDetailUIButton5.layer.borderColor = [self borderBlueColor].CGColor;
        _recommendDetailUIButton5.backgroundColor = [self backgroundBlueColor];
        _recommendDetailUIButton5.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton5];
        [_recommendDetailUIButton5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.recommendDetailUIButton1.mas_bottom).offset(10);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton5;
}

-(UIButton *)recommendDetailUIButton6{
    if (!_recommendDetailUIButton6) {
        _recommendDetailUIButton6 = [UIButton new];
        
        _recommendDetailUIButton6.layer.borderWidth = 1;
        _recommendDetailUIButton6.layer.cornerRadius = 2;
        _recommendDetailUIButton6.clipsToBounds = YES;
        [_recommendDetailUIButton6 setTitleColor:[self borderBlueColor] forState:UIControlStateNormal];
        _recommendDetailUIButton6.layer.borderColor = [self borderBlueColor].CGColor;
        _recommendDetailUIButton6.backgroundColor = [self backgroundBlueColor];
        _recommendDetailUIButton6.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton6];
        [_recommendDetailUIButton6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommendDetailUIButton5.mas_right).offset(10);
            make.top.equalTo(self.recommendDetailUIButton5);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton6;
}

-(UIButton *)recommendDetailUIButton7{
    if (!_recommendDetailUIButton7) {
        _recommendDetailUIButton7 = [UIButton new];
        
        _recommendDetailUIButton7.layer.borderWidth = 1;
        _recommendDetailUIButton7.layer.cornerRadius = 2;
        _recommendDetailUIButton7.clipsToBounds = YES;
        [_recommendDetailUIButton7 setTitleColor:[self borderBlueColor] forState:UIControlStateNormal];
        _recommendDetailUIButton7.layer.borderColor = [self borderBlueColor].CGColor;
        _recommendDetailUIButton7.backgroundColor = [self backgroundBlueColor];
        _recommendDetailUIButton7.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton7];
        [_recommendDetailUIButton7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommendDetailUIButton6.mas_right).offset(10);
            make.top.equalTo(self.recommendDetailUIButton5);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton7;
}

-(UIButton *)recommendDetailUIButton8{
    if (!_recommendDetailUIButton8) {
        _recommendDetailUIButton8 = [UIButton new];
        
        _recommendDetailUIButton8.layer.borderWidth = 1;
        _recommendDetailUIButton8.layer.cornerRadius = 2;
        _recommendDetailUIButton8.clipsToBounds = YES;
        [_recommendDetailUIButton8 setTitleColor:[self borderBlueColor] forState:UIControlStateNormal];
        _recommendDetailUIButton8.layer.borderColor = [self borderBlueColor].CGColor;
        _recommendDetailUIButton8.backgroundColor = [self backgroundBlueColor];
        _recommendDetailUIButton8.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_recommendDetailUIButton8];
        [_recommendDetailUIButton8 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommendDetailUIButton7.mas_right).offset(10);
            make.top.equalTo(self.recommendDetailUIButton5);
            make.height.equalTo(30);
        }];
    }
    return _recommendDetailUIButton8;
}

-(UIButton *)buttonForAll{
    if (!_buttonForAll) {
        _buttonForAll = [UIButton new];
        _buttonForAll.backgroundColor = [UIColor whiteColor];
        _buttonForAll.titleLabel.font = [UIFont systemFontOfSize:15];
        [_buttonForAll setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_buttonForAll setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_buttonForAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_buttonForAll];
        [_buttonForAll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.right.equalTo(-10);
            make.height.equalTo(30);
            make.width.equalTo(60);
        }];
    }
    return _buttonForAll;
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
