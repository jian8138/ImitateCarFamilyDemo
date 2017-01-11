//
//  BrandsDetailTVC.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BrandsDetailTVC.h"

@interface BrandsDetailTVC ()

@property (nonatomic) NSArray<BrandsFactoryitemsModel*>* allFactoryitems;
@property (nonatomic) NSString* ID;


@end

@implementation BrandsDetailTVC

#pragma mark - Lazy

#pragma mark - Life
-(instancetype)initWithStyle:(UITableViewStyle)style andID:(NSString *)ID
{
    if (self = [super initWithStyle:style])
    {
        self.ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"选择车系";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc]bk_initWithBarButtonSystemItem:UIBarButtonSystemItemStop handler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    self.navigationItem.leftBarButtonItem = closeBtn;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    self.tableView.tableFooterView = [UIView new];
    [XuanCheNetManager getBrandsDetailWithValue:self.ID CompletionHandler:^(BrandsDetailModel *model, NSError *error) {
        if(!error)
        {
            self.allFactoryitems = model.result.factoryitems;
            [self.tableView reloadData];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.allFactoryitems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray<BrandsSeriesitemsModel*> *allSeriesitems = self.allFactoryitems[section].seriesitems;
    return allSeriesitems.count;
}

//每个分区表头的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.allFactoryitems[section].name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    NSArray<BrandsSeriesitemsModel*> *allSeriesitems = self.allFactoryitems[indexPath.section].seriesitems;
    BrandsSeriesitemsModel *model = allSeriesitems[indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
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
