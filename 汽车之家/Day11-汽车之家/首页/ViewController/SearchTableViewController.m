//
//  SearchTableViewController.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()<UISearchBarDelegate>
@property (nonatomic, strong)UISearchBar *customSearchBar;

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect mainViewBounds = self.navigationController.view.bounds;
    self.customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(mainViewBounds) + 22, CGRectGetWidth(mainViewBounds), 40)];
    self.customSearchBar.delegate = self;
    self.customSearchBar.backgroundColor = [UIColor whiteColor];
    //背景文字 输入时消失
    self.customSearchBar.placeholder = @"搜索关键字";
    //显示取消按钮
    self.customSearchBar.showsCancelButton = YES;
    //取消按钮变中文取消
    for (UIView *view in [[self.customSearchBar.subviews lastObject] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancelBtn = (UIButton *)view;
            [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
            [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
            cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [cancelBtn bk_addEventHandler:^(id sender) {
                [self dismissViewControllerAnimated:YES completion:nil];
            } forControlEvents:UIControlEventTouchDown];
        }
    }
    //搜索框样式 不显示背景
    self.customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    //字体颜色
    UITextField *searchField = [self.customSearchBar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor cyanColor];
    searchField.font = [UIFont systemFontOfSize:12];
    //placeholder颜色
    [searchField setValue:[UIColor purpleColor] forKeyPath:@"_placeholderLabel.textColor"];
    searchField.layer.cornerRadius = 6;
    [self.navigationController.view addSubview: self.customSearchBar];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    [self.customSearchBar becomeFirstResponder];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchCell"];
    }
    cell.textLabel.text = @"根据";
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"搜索历史                                                    消除";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
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
