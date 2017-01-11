//
//  ForumTableViewController.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ForumTableViewController.h"
#import "ImgOnlyTopCellType.h"
#import "RecommendCellType.h"
#import "Hrs24HotCellType.h"
#import "DetailContentCellType.h"
#import "ForumDataModel.h"
#import "ForumNetManager.h"

@interface ForumTableViewController ()

@property (nonatomic) NSMutableArray<ForumResultListModel*>* dataModel;
@property (nonatomic) NSArray<RecommendListArrayModel*>* recommendModel;
@property (nonatomic) NSInteger pageIndex;

@end

@implementation ForumTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.tabBarItem.image = [UIImage imageNamed:@"tab02"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab02_p"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"论坛";
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[ImgOnlyTopCellType class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[RecommendCellType class] forCellReuseIdentifier:@"cell2"];
    [self.tableView registerClass:[Hrs24HotCellType class] forCellReuseIdentifier:@"cell3"];
    [self.tableView registerClass:[DetailContentCellType class] forCellReuseIdentifier:@"cell4"];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
    self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.pageIndex = 1;
        [ForumNetManager getForumNetManagerWithPagesIndex:self.pageIndex andCompletionHandler:^(ForumDataModel *model, NSError *error) {
            if (!error) {
                self.dataModel = model.result.list.mutableCopy;
                [self.tableView reloadData];
            }
        }];
        [ForumNetManager getForumRecommendModelWithCompletionHandler:^(RecommendModel *model, NSError *error) {
            if (!error) {
                _recommendModel = model.result.list;
            }
        }];
        
        [self.tableView.mj_header endRefreshing];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        self.pageIndex += 1;
        [ForumNetManager getForumNetManagerWithPagesIndex:self.pageIndex andCompletionHandler:^(ForumDataModel *model, NSError *error) {
            if (!error) {
                [self.dataModel addObjectsFromArray:model.result.list];
                [self.tableView reloadData];
            }
        }];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) return self.dataModel.count;
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) return 100;
    if (indexPath.section == 1) return 150;
    if (indexPath.section == 2) return 70;
    return 90;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}


#pragma mark - CELLS

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:{
        ImgOnlyTopCellType *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            NSString *path = [NSString stringWithFormat:@"http://club2.autoimg.cn/album/g23/M0D/79/01/userphotos/2016/11/10/10/500_wKjBwFgj27qAdTO6AAY2NHQjk_w090.jpg"];
            [cell.displayImgView setImageURL:path.ry_url];
            cell.advLabel.text = @"廣告";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            return cell;
            break;
        }
        case 1:{
        RecommendCellType *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
            cell2.titleLabel.text = @"精選推薦";
            
            NSString *str = [NSString stringWithFormat:@" %@ ",_recommendModel[0].categoryname];
            NSLog(@"%@",_recommendModel[0].categoryname);
            [cell2.recommendDetailUIButton1 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[1].categoryname];
            [cell2.recommendDetailUIButton2 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[2].categoryname];
            [cell2.recommendDetailUIButton3 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[3].categoryname];
            [cell2.recommendDetailUIButton4 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[4].categoryname];
            [cell2.recommendDetailUIButton5 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[5].categoryname];
            [cell2.recommendDetailUIButton6 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[6].categoryname];
            [cell2.recommendDetailUIButton7 setTitle:str forState:UIControlStateNormal];
            str = [NSString stringWithFormat:@" %@ ",_recommendModel[7].categoryname];
            [cell2.recommendDetailUIButton8 setTitle:str forState:UIControlStateNormal];
            

            cell2.userInteractionEnabled = NO;
            
            [cell2.buttonForAll setTitle:@"全部 ⇛" forState:UIControlStateNormal];
            
            return cell2;
            break;
        }
        case 2:{
        Hrs24HotCellType *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
            cell3.hotImgView.image = [UIImage imageNamed:@"icon_hot"];
            cell3.hotLabel.text = @"24小時熱帖";
            cell3.userInteractionEnabled = NO;
            return cell3;
            break;
        }
        default:{
        DetailContentCellType *cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
            cell4.titleLabel.text = self.dataModel[indexPath.row].title;
            cell4.forumNameLabel.text = self.dataModel[indexPath.row].bbsname;
            
            cell4.replyCountLabel.text = [NSString stringWithFormat:@"%@回帖",self.dataModel[indexPath.row].replycounts];
            [cell4.iconImgView setImageURL:self.dataModel[indexPath.row].smallpic.ry_url];
            return cell4;
            break;
        }
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        [self.tableView deselectRowAtIndexPath:(indexPath) animated:YES];
    }
}





















@end
