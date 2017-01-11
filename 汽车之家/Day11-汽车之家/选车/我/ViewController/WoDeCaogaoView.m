//
//  WoDeCaogaoView.m
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/11/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WoDeCaogaoView.h"

@interface WoDeCaogaoView ()

@property(nonatomic)UIImageView *image;
@property(nonatomic)UILabel *titleLb;

@end

@implementation WoDeCaogaoView

// 懒加载 ---------------------------------------------------------

-(UIImageView *)image
{
    if (!_image) {
        _image = [UIImageView new];
        [self.view addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(-30);
            make.size.equalTo(100);
        }];
        _image.image = [UIImage imageNamed:@"pic_empty"];
        _image.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _image;
}


- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.view addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.image.mas_bottom).offset(5);
            make.centerX.equalTo(0);
        }];
        _titleLb.text = @"暂无草稿";
    }
    return _titleLb;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self image];
    [self titleLb];
    self.navigationItem.title = @"草稿箱";
    [NSObject getToVC:self];
}



@end
