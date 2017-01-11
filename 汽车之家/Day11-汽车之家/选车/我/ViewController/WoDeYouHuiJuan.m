//
//  WoDeYouHuiJuan.m
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/11/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WoDeYouHuiJuan.h"

@interface WoDeYouHuiJuan ()

@property(nonatomic)UIImageView *iconIV;
@property(nonatomic)NSArray <UITextField *> *text;
@property(nonatomic)UIButton *dengLu;
@property(nonatomic)UIButton *zhuce;
@property(nonatomic)UIButton *wangJiMima;
@property(nonatomic)NSArray<UIImageView *> *image;

@end

@implementation WoDeYouHuiJuan

//  懒加载  -----------------------------------------------------------------

-(UIImageView *)iconIV
{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigV_bg"]];
        [self.view addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(200);
        }];
        UILabel *label = [UILabel new];
        [_iconIV addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(-20);
        }];
        label.text = @"A U T O H O M E";
        label.font = [UIFont systemFontOfSize:30];
        //163 222 249
        label.textColor = [UIColor colorWithRed:163 / 255.0 green:222 / 255.0 blue:249 / 255.0 alpha:1];
        
         }
        return _iconIV;
}

- (NSArray<UITextField *> *)text
{
    if (!_text) {
        
        NSMutableArray *array = [NSMutableArray array];
        NSArray *aryText = @[@"手机号/邮箱/用户名",@"密码"];
        
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 2;i ++)
        {
            UITextField *text = [UITextField new];
            text.placeholder = aryText[i];
            [self.view addSubview:text];
            
            [text mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(30);
                make.right.equalTo(-30);
                if (i == 0)
                {
                    make.top.equalTo(self.iconIV.mas_bottom).offset(40);
                }else
                {
                    make.top.equalTo(lastView.mas_bottom).offset(40);
                }
            }];
            UIImageView *xiaHuaXian = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_register_nickname_remind_bg_108x35_"]];
            [self.view addSubview:xiaHuaXian];
            [xiaHuaXian mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(text.mas_bottom).offset(5);
                make.height.equalTo(3);
                make.left.right.equalTo(text);
            }];
            
            UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_country_background_highlighted"]];
            [self.view addSubview:iv];
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(text);
                make.height.equalTo(1);
                if (i == 0)
                {
                    make.centerY.equalTo(text.mas_bottom).offset(5);
                }
                else
                {
                    make.top.equalTo(text.mas_bottom).offset(5);
                }
            }];
            
            lastView = text;
            [array addObject:lastView];
        }
        _text = array.copy;
    }
    return _text;
}

-(UIButton *)dengLu
{
    if (!_dengLu) {
        _dengLu = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_dengLu ];
        [_dengLu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.text[1]);
            make.top.equalTo(self.text[1].mas_bottom).offset(30);
            make.height.equalTo(50);
        }];
        //149 179  249
        _dengLu.backgroundColor = [UIColor colorWithRed:149 / 255.0 green:179 / 255.0 blue:249 / 255.0 alpha:1];
        _dengLu.tintColor = [UIColor whiteColor];
        [_dengLu setTitle:@"登陆" forState:UIControlStateNormal];
       
        //??? 点击还没写
         }
    return _dengLu;
}

- (UIButton *)zhuce
{
    if (!_zhuce) {
        _zhuce = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_zhuce];
        [_zhuce mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dengLu);
            make.top.equalTo(self.dengLu.mas_bottom).offset(10);
        }];
        [_zhuce setTitle:@"注册" forState:UIControlStateNormal];
        _zhuce.tintColor = [UIColor lightGrayColor];
    }
    return _zhuce;
}


- (UIButton *)wangJiMima
{
    if (!_wangJiMima) {
        _wangJiMima = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_wangJiMima];
        [_wangJiMima mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.dengLu);
            make.top.equalTo(self.dengLu.mas_bottom).offset(10);
        }];
        [_wangJiMima setTitle:@"忘记密码" forState:UIControlStateNormal];
        _wangJiMima.tintColor = [UIColor lightGrayColor];
    }
    return _wangJiMima;
}

- (NSArray<UIImageView *> *)image
{
    if (!_image) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        NSArray<NSString *> *aryText = @[@"me_weibo",@"me_qq_p",@"me_weixin"];
        
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 3; i ++)
        {
            UIImageView *iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:aryText[i]]];
            CGFloat width = (long)([UIScreen mainScreen].bounds.size.width - 240) / 2;
            [self.view addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(-40);
                make.size.equalTo(40);
                if (i == 0)
                {
                    make.left.equalTo(60);
                }else
                {
                    make.left.equalTo(lastView.mas_right).offset(width);
                    if (i == 2)
                    {
                        make.right.equalTo(- 60);
                    }
                }
         }];
            lastView = iconIV;
            [array addObject:lastView];
        }
        _image = array.copy;
    }
    return _image;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

//  视图 ------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    [self iconIV];
    [self text];
    [self dengLu];
    [self zhuce];
    [self wangJiMima];
    [self image];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)GETWode:(UIButton *)sender
{
    NSLog(@"呵呵 ");
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
