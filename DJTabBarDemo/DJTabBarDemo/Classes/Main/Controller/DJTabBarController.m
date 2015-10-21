//
//  DJTabBarController.m
//  DJTabBarDemo
//
//  Created by DJLee on 15/10/20.
//  Copyright © 2015年 yamon. All rights reserved.
//

#import "DJTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


#import "DJTabBar.h"

#define DJColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface DJTabBarController ()<DJTabbarDelegate>

@end

@implementation DJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子控制器
    [self setupSubViewVC];
    //设置tabBar
    [self setupTabBar];
}

- (void)setupSubViewVC{
    [self addChildViewController:[[FirstViewController alloc]init] title:@"首页" image:@"home_normal" selectImg:@"home_highlight"];
    [self addChildViewController:[[SecondViewController alloc]init] title:@"同城" image:@"mycity_normal" selectImg:@"mycity_highlight"];
    [self addChildViewController:[[ThirdViewController alloc]init] title:@"消息" image:@"message_normal" selectImg:@"message_highlight"];
    [self addChildViewController:[[FourthViewController alloc]init] title:@"我的" image:@"account_normal" selectImg:@"account_highlight"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectImg:(NSString *)selectImage{
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = DJColor(0, 0, 0);
    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateSelected];
    
    UINavigationController *unc = [[UINavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:unc];
}

- (void)setupTabBar{
    DJTabBar *tabbar = [[DJTabBar alloc]init];
    tabbar.delegate1 = self;
    [self setValue:tabbar forKey:@"tabBar"];
}


#pragma mark -
#pragma mark -
- (void)tabBarDidClickPlusButton:(DJTabBar *)tabBar{
    NSLog(@"点击了");
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
