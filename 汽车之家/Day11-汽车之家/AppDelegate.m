//
//  AppDelegate.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [XuanCheNetManager getBrandsDetailWithValue:@"3" CompletionHandler:^(BrandsDetailModel *model, NSError *error) {
//        NSLog(@"%@",model);
//    }];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:[[SelectTableViewController alloc]init]];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];

    
//    [NetManager getCarWithType:NewsTypeCarNewest lastTime:@"0" completionHander:^(CarNewestModel *model, NSError *error) {
//        NSLog(@"");
//    }];
//    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    UITabBarController *tabBar = [UITabBarController new];
//    CGRect frame = self.window.bounds;
//    tabBar.tabBar.frame = CGRectMake(0, CGRectGetHeight(frame) - 45, CGRectGetWidth(frame), 45);
//    UIView * transitionView = [[tabBar.view subviews] objectAtIndex:0];
//    frame.size.height = CGRectGetHeight(frame) - 45;
//    transitionView.frame = frame;
//    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
//    [UIImageView appearance].clipsToBounds = YES;
//    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:[HomePageViewController new]];
//    UINavigationController *forumNavi = [[UINavigationController alloc] initWithRootViewController:[[ForumTableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
//    UINavigationController *selectNavi = [[UINavigationController alloc] initWithRootViewController:[[SelectTableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
//    UINavigationController *meNavi = [[UINavigationController alloc] initWithRootViewController:[[MeTableViewController alloc] initWithStyle:UITableViewStylePlain]];
//    tabBar.viewControllers = @[homeNavi,forumNavi,selectNavi,meNavi];
//    tabBar.selectedIndex = 0;
//    self.window.rootViewController = tabBar;
//    [self.window makeKeyAndVisible];

    [NetManager getCarWithType:NewsTypeCarNewest lastTime:@"20161118135223" completionHander:^(CarNewestModel *model, NSError *error) {
        NSLog(@"");
    }];
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabBar = [UITabBarController new];
    CGRect frame = self.window.bounds;
    tabBar.tabBar.frame = CGRectMake(0, CGRectGetHeight(frame) - 45, CGRectGetWidth(frame), 45);
    UIView * transitionView = [[tabBar.view subviews] objectAtIndex:0];
    frame.size.height = CGRectGetHeight(frame) - 45;
    transitionView.frame = frame;
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    [UIImageView appearance].clipsToBounds = YES;
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:[HomePageViewController new]];
    UINavigationController *forumNavi = [[UINavigationController alloc] initWithRootViewController:[[ForumTableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
    UINavigationController *selectNavi = [[UINavigationController alloc] initWithRootViewController:[[SelectTableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
    UINavigationController *meNavi = [[UINavigationController alloc] initWithRootViewController:[[MeTableViewController alloc] initWithStyle:UITableViewStylePlain]];
    tabBar.viewControllers = @[homeNavi,forumNavi,selectNavi,meNavi];
    tabBar.selectedIndex = 0;
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    

    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
