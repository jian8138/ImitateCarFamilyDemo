//
//  SheZhi.m
//  Day11-汽车之家
//
//  Created by tarena43 on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SheZhi.h"

//自定义的 cell
#import "ShiZhiCell.h"

@interface SheZhi ()

@end

@implementation SheZhi

//初始化
-(instancetype)initWithStyle:(UITableViewStyle)style andJieSheZhi:(NSString *)shezhi
{
    if (self = [super initWithStyle:style])
    {
        _JieSheZhi = shezhi;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =_JieSheZhi;
    [NSObject getToVC:self];
    
    [self.tableView registerClass:[ShiZhiCell class] forCellReuseIdentifier:@"cell"];
   
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
    self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);

    self.tableView.separatorInset = UIEdgeInsetsZero;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

// TableView的代理方法  ------------------------------------------------

//分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}

//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 6;
    return 4;
}

//cell 的样子
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShiZhiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0)
            {
                cell.titleLb.text = @"正文字号";
                NSArray *array = @[@"大",@"中",@"小"];
                [cell.ZhiTi enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj setTitle:array[idx] forState:UIControlStateNormal];
                    obj.selected = NO;
                    [obj addTarget:self action:@selector(button:) forControlEvents: UIControlEventTouchUpInside];
                }];
                
            }
            if (indexPath.row == 1)
            {
                cell.titleLb.text = @"文章/帖子小图模式";
                cell.Switch.on = NO;
                [cell.Switch addTarget:self action:@selector(WeiZhang:) forControlEvents:UIControlEventValueChanged];
            }
            if (indexPath.row == 2)
            {
                cell.titleLb.text = @"车型图片高清图片显示";
                cell.jianjieLb.text = @"高清模式下耗费更多流量";
                cell.Switch.on = NO;
                [cell.Switch addTarget:self action:@selector(CheXing:) forControlEvents:UIControlEventValueChanged];
            }
            if (indexPath.row == 3)
            {
                cell.titleLb.text = @"论坛摘要模式";
                cell.Switch.on = NO;
                [cell.Switch addTarget:self action:@selector(LunTan:) forControlEvents:UIControlEventValueChanged];
            }
            if (indexPath.row == 4)
            {
                cell.titleLb.text = @"推送模式";
                cell.accessoryType = 1;
            }
            if (indexPath.row == 5)
            {
                cell.titleLb.text = @"清楚缓存";
                cell.ContentLb.text =@"19M";
            }
            
            break;
        case 1:
            cell.accessoryType = 1;
            if (indexPath.row ==0)
            {
                cell.titleLb.text = @"帮助与反馈";
            }
            if (indexPath.row == 1)
            {
                cell.titleLb.text = @"去AppStore给个5星把!";
            }
            if (indexPath.row == 2)
            {
                cell.titleLb.text = @"检测更新";
            }
            if (indexPath.row == 3)
            {
                cell.titleLb.text =@"关于汽车之家";
            }
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}



//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 2) return 80;
        
    return 55;
}


//点击第一行字体的反应
-(void)button:(UIButton *)sender
{
    sender.selected = YES;
    [sender setBackgroundImage:[UIImage imageNamed:@"select_circle_blue"] forState:UIControlStateSelected];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    NSLog(@"button");
}
//第1个
-(void)WeiZhang:(UISwitch *)senser
{
    NSLog(@"1");
}

//第2个
-(void)CheXing:(UISwitch *)senser
{
    NSLog(@"2");
}

//第3个
-(void)LunTan:(UISwitch *)senser
{
    NSLog(@"3");
}

@end
