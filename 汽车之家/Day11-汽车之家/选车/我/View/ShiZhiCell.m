//
//  ShiZhiCell.m
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ShiZhiCell.h"

@implementation ShiZhiCell

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(5);
            make.width.equalTo([UIScreen mainScreen].bounds.size.width / 2);
        }];
    }
    return _titleLb;
}


-(NSArray<UIButton *> *)ZhiTi
{
    if (!_ZhiTi) {
        _ZhiTi = [NSArray new];
        
        UIButton *view =nil;
        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger i = 0; i < 3; i ++)
        {
            UIButton *button = [UIButton new];
            [self.contentView addSubview:button];
           
            if (i == 1)
            {
                button.tag = 100;
            }
            if (i == 2)
            {
                button.tag = 200;
            }else{
                button.tag = 300;
            }
            
            
            
            //给button 弄圆
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.layer.cornerRadius = 15;
            button.layer.masksToBounds = YES;
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.titleLb);
                make.size.equalTo(30);
                if (i == 0)
                {
                    make.right.equalTo(-5);
                }else
                {
                    make.right.equalTo(view.mas_left).offset(-5);
                if (i == 2)
                {
                    make.left.equalTo(self.titleLb.mas_right).offset(100);
                }
                }
            }];
            view = button;
            [array addObject:button];
        }
        _ZhiTi = array.copy;
    }
    return _ZhiTi;
}


-(UILabel *)ContentLb
{
    if (!_ContentLb) {
        _ContentLb = [UILabel new];
        [self.contentView addSubview:_ContentLb];
        [_ContentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(self.titleLb);
        }];
        _ContentLb.font = [UIFont systemFontOfSize:15];
        _ContentLb.textColor = [UIColor lightGrayColor];
    }
    return _ContentLb;
}


-(UISwitch *)Switch
{
    if (!_Switch) {
        _Switch = [UISwitch new];
        [self.contentView addSubview:_Switch];
        [_Switch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLb);
            make.right.equalTo(-5);
        }];
    }
    return _Switch;
}

-(UILabel *)jianjieLb
{
    if (!_jianjieLb) {
        _jianjieLb = [UILabel new];
        [self.contentView addSubview:_jianjieLb];
        [_jianjieLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLb.mas_bottom).offset(3);
            make.left.equalTo(self.titleLb);
        }];
        _jianjieLb.font = [UIFont systemFontOfSize:12];
        _jianjieLb.textColor = [UIColor lightGrayColor];
    }
    return _jianjieLb;
}

@end
