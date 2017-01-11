//
//  HomePageViewController.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()<UISearchBarDelegate>
@end

@implementation HomePageViewController

- (instancetype)init{
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"tab01"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab01_p"];
        
//        UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        //把不受影响的图片 设置为 tabbarItem中的 选中图片
//        self.tabBarItem.selectedImage = selectedImage;
    }
    return self;
}

- (NSArray<NSString *> *)titles{
    return @[@"推荐", @"新闻", @"评测", @"导购", @"行情", @"用车", @"技术", @"文化", @"改装", @"游记"];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    return [[CarNewestTableViewController alloc] initWithType:index];
}
- (void)viewDidLoad {
    //题目的背景栏颜色
    self.menuBGColor = [UIColor clearColor];
    //题目的显示效果
    self.menuViewStyle = WMMenuViewStyleLine;
    //题目的高度
    self.menuHeight = 45;
    //设置选中文字颜色
    self.titleColorSelected = [UIColor blackColor];
    //设置未选中文字颜色
    self.titleColorNormal = [UIColor grayColor];
    //设置下划线(或者边框)颜色
    self.progressColor = [UIColor blackColor];
    [super viewDidLoad];
    //左边导航栏
    UIButton *radioBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    radioBtn.frame = CGRectMake(0, 0, 90, 44);
    [radioBtn setImage:[UIImage imageNamed:@"nav_icon_radio"] forState:UIControlStateNormal];
    [radioBtn setImage:[UIImage imageNamed:@"nav_icon_radio_p"] forState:UIControlStateHighlighted];
    radioBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 15, 10, 45);
    [radioBtn setTitle:@"音频" forState:UIControlStateNormal];
    //button标题的偏移量，这个偏移量是相对于图片的
    radioBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    //不设置 文字不会显示
    [radioBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    radioBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem *radioItem = [[UIBarButtonItem alloc] initWithCustomView:radioBtn];
    //专门修复导航栏中的按钮之间的距离控件(木棍控件)
    UIBarButtonItem *leftSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftSpaceItem.width = -15;
    //leftBarButtonItems 从左向右排列
    self.navigationItem.leftBarButtonItems = @[leftSpaceItem, radioItem];
    //右边导航栏
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 45, 44);
    [searchBtn setImage:[UIImage imageNamed:@"nav_icon_search"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"nav_icon_search_p"] forState:UIControlStateHighlighted];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    //专门修复导航栏中的按钮之间的距离控件
    UIBarButtonItem *rightSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    rightSpaceItem.width = -15;
    //rightBarButtonItems 从右向左排列
    self.navigationItem.rightBarButtonItems = @[rightSpaceItem, searchItem];
    //进入搜索栏界面
    SearchTableViewController *searchvc = [[SearchTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *searchNavi = [[UINavigationController alloc] initWithRootViewController:searchvc];
    [searchBtn bk_addEventHandler:^(id sender) {
        [self presentViewController:searchNavi animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
