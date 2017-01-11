//
//  CarNewestTableViewController.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CarNewestTableViewController.h"

@interface CarNewestTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic)NSArray<CarNewestResultFocusModel *> *focuSArray;
@property(nonatomic)NSMutableArray<CarNewestResultListModel *> *dataList;

@property (nonatomic) UIView *topView;
@property (nonatomic) iCarousel *ic;

@property (nonatomic) UIPageControl *pageC;
@property (nonatomic) NSTimer *timer;

@end

@implementation CarNewestTableViewController

#pragma mark - iC Delegate
//1.有多少个 numberOfItems
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return _focuSArray.count;
}

//2.长什么样子 viewForItemAtIndex
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
    }
    CarNewestResultFocusModel *model = _focuSArray[index];
    [((UIImageView *)view) setImageURL:model.imgurl.rm_URL];
    return view;
}

//指定某些显示的参数 valueForOption
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
//当滚动时触发 IndexDidChange
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageC.currentPage = carousel.currentItemIndex;
}

//当被选中时触发
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    CarNewestResultFocusModel *model = _focuSArray[index];
    NSString *path = [NSString stringWithFormat:@"http://cont.app.autohome.com.cn/autov5.0.0/content/news/newscontent-n%ld-t0-rct1.json", model.idField];
    DetailViewController *dvc = [[DetailViewController alloc] initWithURL:path.rm_URL];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (UIView *)topView{
    if (!_topView) {
        //表的头是通过=号赋值的, 不是addSubview. 所以不能用masonry
        //表头的视图大小, x y 宽 都无效
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, [UIScreen mainScreen].bounds.size.width / 2)];
        self.tableView.tableHeaderView = _topView;
        _ic = [iCarousel new];
        [_topView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0;
        
        _pageC = [UIPageControl new];
        [_topView addSubview:_pageC];
        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-7);
            make.bottom.equalTo(8);
        }];
    }
    return _topView;
}
- (id)initWithType:(NewsType)type{
    if (self = [super init]) {
        self.newsType = type;
    }
    return self;
}

- (NSMutableArray<CarNewestResultListModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.tableView registerClass:[ThreePicCell class] forCellReuseIdentifier:@"ThreePicCell"];
    [self.tableView registerClass:[CarCell class] forCellReuseIdentifier:@"CarCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getCarWithType:self.newsType lastTime:@"0" completionHander:^(CarNewestModel *model, NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (!error) {
                [self.tableView showMsg:@"正在加载"];
                //判断是否有头部视图
                _focuSArray = model.result.focusimg;
                //如果没内容 停止定时器
                [_timer invalidate];
                _timer = nil;
                if (_focuSArray && _focuSArray.count > 0) {
                    [self topView];
                    [_ic reloadData];
                    _pageC.numberOfPages = _focuSArray.count;
                    //第三方 BlocksKit 提供了把系统默认的target+selector的调用方式 转为block的形式
                    _timer = [NSTimer scheduledTimerWithTimeInterval:3 block:^(NSTimer * _Nonnull timer) {
                        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
                    } repeats:YES];
                }else{
                    self.tableView.tableHeaderView = nil;
                }
                [self.dataList removeAllObjects];
                [self.dataList addObjectsFromArray:model.result.newslist];
                [self.tableView reloadData];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getCarWithType:self.newsType lastTime:self.dataList.lastObject.lasttime  completionHander:^(CarNewestModel *model, NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            if (!error) {
                [self.dataList addObjectsFromArray:model.result.newslist];
                [self.tableView reloadData];
            }
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarNewestResultListModel *model = self.dataList[indexPath.row];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 4;
    NSDictionary *attribute = @{NSParagraphStyleAttributeName:paragraphStyle};
    if (model.indexdetail.length > 0 && ![model.type isEqualToString:@"c"]) {
        ThreePicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreePicCell"forIndexPath:indexPath];
        cell.titleLb.attributedText = [[NSAttributedString alloc]initWithString:model.title attributes:attribute];
            if ([model.type isEqualToString:@"1"]) {
                NSArray *array = [model.indexdetail componentsSeparatedByString:@"㊣"];
                NSArray<NSString *> *array2 = [array[2] componentsSeparatedByString:@","];
                [cell.icons enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    //对于数组类型 一定要用新特性指定内部存储的元素类型, 这样xcode才能做到 代码推测
                    [obj setImageURL:array2[idx].rm_URL];
                }];
                cell.countLb.text = [NSString stringWithFormat:@"%ld图片", model.replycount];
            }else{
                NSArray<NSString *> *array = [model.indexdetail componentsSeparatedByString:@"㊣"];
                [cell.icons enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    //对于数组类型 一定要用新特性指定内部存储的元素类型, 这样xcode才能做到 代码推测
                    [obj setImageURL:array[idx].rm_URL];
                }];
                NSInteger count = model.replycount;
                if (count > 10000) {
                    cell.countLb.text = [NSString stringWithFormat:@"图说   %.1f万评论", count / 10000.0];
                }else{
                    //此代码不写在else里面if判断不会实现
                    cell.countLb.text = [NSString stringWithFormat:@"图说   %ld评论", count];
                }
            }
        NSArray *timeArray = [model.time componentsSeparatedByString:@"6-"];
        cell.timeLb.text = timeArray[1];
        return cell;
    }else{
        CarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarCell"forIndexPath:indexPath];
        [cell.iconIV setImageURL:model.smallpic.rm_URL];
        cell.titleLb.attributedText = [[NSAttributedString alloc]initWithString:model.title attributes:attribute];
        NSArray *array = [model.time componentsSeparatedByString:@"6-"];
        cell.timeLb.text = array[1];
        NSInteger count = model.replycount;
        if (count > 10000) {
            if ([model.type isEqualToString:@"c"]) {
                cell.countLb.text = [NSString stringWithFormat:@"%.1f万回帖", count / 10000.0];
            }else{
                cell.countLb.text = [NSString stringWithFormat:@"%.1f万评论", count / 10000.0];
            }
        }else{
            if ([model.type isEqualToString:@"c"]) {
                cell.countLb.text = [NSString stringWithFormat:@"%ld回帖", count];
            }else{
                //此代码不写在else里面if判断不会实现
                cell.countLb.text = [NSString stringWithFormat:@"%ld评论", count];
            }
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CarNewestResultListModel *model = self.dataList[indexPath.row];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 4;
    NSDictionary *attribute = @{NSParagraphStyleAttributeName:paragraphStyle};
    if (model.indexdetail.length > 0 && ![model.type isEqualToString:@"c"]) {
        return [tableView fd_heightForCellWithIdentifier:@"ThreePicCell" configuration:^(ThreePicCell *cell) {
            cell.titleLb.attributedText = [[NSAttributedString alloc]initWithString:model.title attributes:attribute];
            NSInteger count = model.replycount;
            if (count > 10000) {
                cell.countLb.text = [NSString stringWithFormat:@"图说   %.1f万评论", count / 10000.0];
            }else{
                //此代码不写在else里面if判断不会实现
                cell.countLb.text = [NSString stringWithFormat:@"图说   %ld评论", count];
            }
            NSArray *timeArray = [model.time componentsSeparatedByString:@"6-"];
            cell.timeLb.text = timeArray[1];
        }];
    }
    return [tableView fd_heightForCellWithIdentifier:@"CarCell" configuration:^(CarCell *cell) {
        cell.titleLb.attributedText = [[NSAttributedString alloc]initWithString:model.title attributes:attribute];
        NSArray *array = [model.time componentsSeparatedByString:@"6-"];
        cell.timeLb.text = array[1];
        NSInteger count = model.replycount;
        if (count > 10000) {
            cell.countLb.text = [NSString stringWithFormat:@"%.1f万评论", count / 10000.0];
        }else{
            //此代码不写在else里面if判断不会实现
            cell.countLb.text = [NSString stringWithFormat:@"%ld评论", count];
        }
    }];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CarNewestResultListModel *model = _dataList[indexPath.row];
    NSString *path = [NSString stringWithFormat:@"http://cont.app.autohome.com.cn/autov5.0.0/content/news/newscontent-n%ld-t0-rct1.json", model.idField];
    DetailViewController *dvc = [[DetailViewController alloc] initWithURL:path.rm_URL];
    [self.navigationController pushViewController:dvc animated:YES];
    
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
