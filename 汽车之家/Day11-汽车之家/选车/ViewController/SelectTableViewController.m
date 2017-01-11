//
//  SelectTableViewController.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SelectTableViewController.h"
#import "ListCell.h"
#import "HotbrandsCell.h"
#import "AdvertCell.h"
#import "BrandsDetailTVC.h"

#define kPicPath @"http://x.autoimg.cn/app/image/brands/%@.png"

@interface SelectTableViewController ()

@property (nonatomic) NSArray<branditemsModel*>* allListModel;
@property (nonatomic) NSMutableArray* indexArray;
@property (nonatomic) NSMutableArray* stortArray;

@property (nonatomic, strong) UILabel *sectionTitleView;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic) NSArray<hotbrandsModel*>* allHotbrands;
@property (nonatomic) NSArray<advertModel*>* allAdvert;

@end

@implementation SelectTableViewController

#pragma mark - Lazy

-(UILabel *)sectionTitleView
{
    if (!_sectionTitleView)
    {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat heihgt = [UIScreen mainScreen].bounds.size.height;
        _sectionTitleView = [[UILabel alloc] initWithFrame:CGRectMake((width-100)/2,(heihgt-100)/2,100,100)];
        _sectionTitleView.textAlignment = NSTextAlignmentCenter;
        _sectionTitleView.font = [UIFont boldSystemFontOfSize:60];
        _sectionTitleView.textColor = [UIColor blackColor];
        _sectionTitleView.backgroundColor = [UIColor clearColor];
        [self.navigationController.view addSubview:_sectionTitleView];
    }
    return _sectionTitleView;
}

#pragma mark - Life
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.tabBarItem.image = [UIImage imageNamed:@"tab03"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab03_p"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选车";
    
    [self.tableView registerClass:[ListCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [XuanCheNetManager getXuanCheListDataWithType:1 CompletionHandler:^(XuanCheDataModel *model, NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (!error)
            {
                self.allListModel = model.result.branditems;
                self.indexArray = [self indexArray:self.allListModel].mutableCopy;
                self.stortArray = [self sortArray:self.allListModel].mutableCopy;
                [self.indexArray insertObject:@"主" atIndex:0];
                [self.indexArray insertObject:@"热" atIndex:0];
                
                [self.stortArray insertObject:@"" atIndex:0];
                [self.stortArray insertObject:@"" atIndex:0];
                
                self.allHotbrands = [XuanCheNetManager createFakeHotbrands];
                self.allAdvert = [XuanCheNetManager createFakeAdvert];
                [self.tableView reloadData];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    //右边索引样式
    self.tableView.sectionIndexColor = [UIColor blackColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
}

//根据 bfirstletter属性 返回分区
-(NSArray*)indexArray:(NSArray<branditemsModel*> *)array
{
    NSMutableArray *mArray = [NSMutableArray array];
    NSString *tempStr;
    for (branditemsModel *model in array)
    {
        if (![tempStr isEqualToString:model.bfirstletter])
        {
            [mArray addObject:model.bfirstletter];
        }
        tempStr = model.bfirstletter;
    }
    return mArray;
}

//把汽车品牌model分类 放入 到二维数组中
-(NSArray*)sortArray:(NSArray<branditemsModel*> *)array
{
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:self.indexArray.count];
    NSString *tempStr ;
    NSMutableArray *tempArr = [NSMutableArray array];
    
     for (branditemsModel *model in array)
     {
         if (![tempStr isEqualToString:model.bfirstletter])
         {
             tempArr = [NSMutableArray array];
             [tempArr addObject:model];
             [mArray addObject:tempArr];
             tempStr = model.bfirstletter;
         }
         else
         {
             [tempArr addObject:model];
         }
     }
    return mArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view 右侧index
//右侧索引的数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexArray;
}
//每个分区表头的标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(section == 0) return @"热门品牌";
//    return self.indexArray[section];
//}
//点击右侧索引后执行的代理方法
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [self showSectionTitle:title];
    return index;
}
//居中显示大写字母框
-(void)showSectionTitle:(NSString*)title{
    [self.sectionTitleView setText:title];
    self.sectionTitleView.hidden = NO;
    self.sectionTitleView.alpha = 1;
    
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:NO];
}
//定时器 显示大写字母框的时间
- (void)timerHandler:(NSTimer *)sender
{
    [UIView animateWithDuration:.3 animations:^{
        self.sectionTitleView.alpha = 0;
    } completion:^(BOOL finished) {
        self.sectionTitleView.hidden = YES;
    }];
}
//表头的显示
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [UILabel new];
    lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.text = [NSString stringWithFormat:@"  %@",self.indexArray[section]];
    if(section == 0 ) lab.text = @"  热门品牌";
    if(section == 1 ) lab.text = @"  主打车";
    lab.textColor = [UIColor blackColor];
    return lab;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark - Table view 三问一答
//有多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.indexArray.count;
}
//每个分区有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0 || section == 1)  return 1;
    return [self.stortArray[section] count];
}
//每行长什么样
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section)
    {
        case 0:
        {
            HotbrandsCell *cell = [[HotbrandsCell alloc]init];
            for (NSInteger i = 0; i < self.allHotbrands.count; i++)
            {
                hotbrandsModel *model = self.allHotbrands[i];
                [cell.iconIVs[i] setImageURL:model.img.rm_URL];
                cell.nameLBs[i].text = model.name;
            }
            return cell;
        }
        case 1:
        {
            AdvertCell *cell = [[AdvertCell alloc]init];
            for (NSInteger i = 0; i < self.allAdvert.count; i++)
            {
                advertModel *model = self.allAdvert[i];
                [cell.iconIV[i] setImageURL:model.img.rm_URL];
                cell.nameLB[i].text = model.seriesname;
            }
            return cell;
        }
        default:
        {
            ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
            branditemsModel *model = self.stortArray[indexPath.section][indexPath.row];
            cell.nameLB.text = model.name;
            NSURL *picURL = [NSString stringWithFormat:kPicPath,model.ID].rm_URL;
            [cell.iconIV setImageURL:picURL];
            
            return cell;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==  0 ||indexPath.section ==  1) return;
    branditemsModel *model = self.stortArray[indexPath.section][indexPath.row];
    BrandsDetailTVC *bTVC = [[BrandsDetailTVC alloc]initWithStyle:UITableViewStylePlain andID:model.ID];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:bTVC];
    [self presentViewController:navi animated:YES completion:nil];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
