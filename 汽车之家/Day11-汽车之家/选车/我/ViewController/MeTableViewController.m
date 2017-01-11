//
//  MeTableViewController.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MeTableViewController.h"

//设置
#import "SheZhi.h"
//我的草稿
#import "WoDeCaogaoView.h"
//浏览历史
#import "LiuNanLIshi.h"
//我的优惠劵
#import "WoDeYouHuiJuan.h"


@interface MeTableViewController ()

@property(nonatomic)UIView *touBuView;
@property(nonatomic)UIView *qunPingView;

@end

@implementation MeTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
       
        self.tabBarItem.image = [UIImage imageNamed:@"tab05"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab05_p"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (UIView *)qunPingView
{
    if (!_qunPingView) {
        _qunPingView = [UIView new];
        [self.view addSubview:_qunPingView];
        [_qunPingView mas_makeConstraints:^(MASConstraintMaker *make){
            make.edges.equalTo(0);
        }];
        _qunPingView.backgroundColor = [UIColor redColor];
    }
    return _qunPingView;
}

- (UIView *)touBuView
{
    if (!_touBuView) {
        _touBuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 300)];
        self.tableView.tableHeaderView = _touBuView;
        
        _touBuView.backgroundColor = [UIColor whiteColor];
   
        
        UIButton *LeftYue = [UIButton buttonWithType:UIButtonTypeSystem];
        [_touBuView addSubview:LeftYue];
        [LeftYue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.top.equalTo(10);
            make.size.equalTo(30);
        }];
        [LeftYue setImage:[UIImage imageNamed:@"me_night"] forState:UIControlStateNormal];
        [self GETView:LeftYue NSString:@"me_sunny_p" andNSString:@"me_night"];
        
        UIImageView *TouXiang = [UIImageView new];
        [_touBuView addSubview:TouXiang];
        [TouXiang mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(0);
            make.top.equalTo(50);
            make.size.equalTo(90);
        }];
        [self GET:TouXiang and:@"article_man_default_80" andoffset:45];
        
        
        UILabel *ZhangHao = [UILabel new];
        [_touBuView addSubview:ZhangHao];
        [ZhangHao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(TouXiang.mas_bottom).offset(3);
            make.centerX.equalTo(0);
        }];
        ZhangHao.text = @"账号登陆";
        ZhangHao.textColor = [UIColor lightGrayColor];
        ZhangHao.font = [UIFont systemFontOfSize:15];
        
        
        UIView *LastViewIconIV = nil;
        NSArray *arrayIV = @[@"me_weibo",@"me_qq_p",@"me_weixin"];
        
        NSArray *arrayLb = @[@"新浪微博",@"腾讯QQ",@"微信登陆"];
        
        for (NSInteger i = 0; i < 3; i ++) {
            UIImageView *iconIV = [UIImageView new];
            [_touBuView addSubview:iconIV];
            
            [self GET:iconIV and:arrayIV[i] andoffset:20];
            
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(40);
                make.bottom.equalTo(-35);
                
                if (i == 0)
                {
                    make.left.equalTo(([UIScreen mainScreen].bounds.size.width - 120)  /  4);
                }else
                {
                    make.left.equalTo(LastViewIconIV.mas_right).offset(([UIScreen mainScreen].bounds.size.width - 120)  /  4);
                    if (i == 2)
                    {
                        make.right.equalTo(- ([UIScreen mainScreen].bounds.size.width - 120)  /  4);
                    }
                }
                
            }];
            
            UILabel *titleLb = [UILabel new];
            [_touBuView addSubview:titleLb];
            
            titleLb.text = arrayLb[i];
            titleLb.font = [UIFont systemFontOfSize:12];
            titleLb.textColor = [UIColor blackColor];
            [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(iconIV.mas_bottom).offset(3);
                if (i == 0)
                {
                    make.centerX.equalTo(iconIV);
                }
                if (i == 1)
                {
                    make.centerX.equalTo(iconIV);
                }
                if (i == 2)
                {
                    make.centerX.equalTo(iconIV);
                }
                
            }];
            LastViewIconIV = iconIV;
        }
    }
    return _touBuView;
}


//  视图    --------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    [self touBuView];
    [self qunPingView];
    self.navigationItem.title = @"我";
   
}


//  TableView 的 代理 方法 --------------------------------------------

#pragma mark - Table view data source


//这个方法 是把图片弄圆   并填充  和拼接
- (void)GET:(UIImageView *)image and:(NSString *)path andoffset:(NSInteger)number
{
    image.contentMode = UIViewContentModeScaleAspectFill;
    image.image = [UIImage imageNamed:path];
    
    image.layer.cornerRadius = number;
    image.layer.masksToBounds = YES;
}

- (void)GETView:(UIButton *)but NSString:(NSString *)str1 andNSString:(NSString *)str2
{
    static BOOL on = YES;
    
    [but bk_addEventHandler:^(id sender) {
        if (on == YES)
        {
            [but setImage:[UIImage imageNamed:str1] forState:UIControlStateNormal];
            self.qunPingView.alpha = 1;
            self.qunPingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            self.qunPingView.backgroundColor = [UIColor redColor];
        }else
        {
            [but setImage:[UIImage imageNamed:str2] forState:UIControlStateNormal];
            self.qunPingView.alpha = 0;
        }
        on = !on;

    } forControlEvents:UIControlEventTouchUpInside];
}


//表头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 15;
    return 10;
}

//表尾的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


//分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) return 2;
    return 1;
}

//cell 样子
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
        cell.accessoryType = 1;
    switch (indexPath.section) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"article_icon_collection_p2"];
            cell.textLabel.text = @"我的收藏";
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"me_coupon"];
            cell.textLabel.text = @"我的优惠券";
            break;
        case 2:
            if (indexPath.row == 0 )
            {
            cell.imageView.image = [UIImage imageNamed:@"me_browsing-history"];
            cell.textLabel.text = @"浏览历史";
            }
            else
            {
            cell.imageView.image = [UIImage imageNamed:@"me_draft"];
            cell.textLabel.text = @"我的草稿";
            }
            break;
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"setting"];
            cell.textLabel.text = @"设置";
            break;
    }
    return cell;
}



//点击跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        [self.navigationController pushViewController:[[LiuNanLIshi alloc] initWithNSString:@"我的收藏"] animated:YES];
    }
    
    //跳转到 我的优惠券
    if (indexPath.section == 1)
    {
        [self presentViewController:[WoDeYouHuiJuan new] animated:YES completion:nil];
    }
    
    if (indexPath.section == 2) {
        //跳转到浏览历史
        if (indexPath.row == 0)
        {
            [self.navigationController pushViewController:[[LiuNanLIshi alloc] initWithNSString:@"浏览历史"] animated:YES];
        }
        //跳转到我的草稿
        if (indexPath.row == 1)
        {
            [self.navigationController pushViewController:[WoDeCaogaoView new] animated:YES];
        }
    }
    //跳转设置
    if (indexPath.section == 3)
    {
        [self.navigationController pushViewController:[[SheZhi alloc] initWithStyle:UITableViewStyleGrouped andJieSheZhi:@"设置"] animated:YES];
    }
}

@end
