//
//  DJTabBar.h
//  DJTabBarDemo
//
//  Created by DJLee on 15/10/20.
//  Copyright © 2015年 yamon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJTabBar;
@protocol DJTabbarDelegate <NSObject>

- (void)tabBarDidClickPlusButton:(DJTabBar *)tabBar;
@end
@interface DJTabBar : UITabBar

@property (nonatomic,weak)id<DJTabbarDelegate>delegate1;
@end
