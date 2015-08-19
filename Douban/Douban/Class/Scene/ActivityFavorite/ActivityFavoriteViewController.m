//
//  ActivityFavoriteViewController.m
//  Douban
//
//  Created by wp on 14-11-8.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import "Defined.h"
#import "ActivityFavoriteViewController.h"
#import "FavoriteDataHandle.h"
#import "Activity.h"

#import "ActivityDetailViewController.h"

@interface ActivityFavoriteViewController ()

@end

@implementation ActivityFavoriteViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"活动收藏";
    //初始化数据源
    [[FavoriteDataHandle shareInstance] setupActivityDataSource];

    //注册消息：“刷新表视图”
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableViewwNotification:) name: kReloadTableViewNotification object:nil];

}


- (void)reloadTableViewwNotification:(NSNotification *)notification
{
    NSLog(@"收到刷新的消息");
    //重新初始化数据源
    [[FavoriteDataHandle shareInstance] setupActivityDataSource];
    [self.tableView reloadData];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[FavoriteDataHandle shareInstance] countOfActivity];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"activityCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    
    Activity * act = [[FavoriteDataHandle shareInstance] activityForRow:indexPath.row];
    
    cell.textLabel.text = act.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    ActivityDetailViewController * detailVC = [[ActivityDetailViewController alloc] init];
    
    detailVC.activity = [[FavoriteDataHandle shareInstance] activityForRow:indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    [detailVC release];
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        //删除数据
        [[FavoriteDataHandle shareInstance] deleteActivityForRow:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
