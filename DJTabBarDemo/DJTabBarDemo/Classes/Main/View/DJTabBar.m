//
//  DJTabBar.m
//  DJTabBarDemo
//
//  Created by DJLee on 15/10/20.
//  Copyright © 2015年 yamon. All rights reserved.
//

#import "DJTabBar.h"
#import "UIView+Extension.h"
#import "DWPublishButton.h"
@interface DJTabBar()
@property (nonatomic,weak)DWPublishButton *centerBtn;
@end
@implementation DJTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [[DJTabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
        [[DJTabBar appearance] setShadowImage:[[UIImage alloc] init]];
        
        DWPublishButton *btn = [DWPublishButton publishButton];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.centerBtn = btn;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.centerBtn.centerX = self.width * 0.5;
    self.centerBtn.centerY = self.height * 0.5;
    
    CGFloat tabbarBtnW = self.frame.size.width /5;
    CGFloat tabbarBtnIndex = 0;
    for(UIView *child in self.subviews){
        Class cls = NSClassFromString(@"UITabBarButton");
        if([child isKindOfClass:cls]){
            child.width = tabbarBtnW;
            child.x = tabbarBtnW * tabbarBtnIndex;
            tabbarBtnIndex ++;
            if(tabbarBtnIndex == 2){
                tabbarBtnIndex ++;
            }
        }
    }
}

- (void)btnClick{
    if([self.delegate1 respondsToSelector:@selector(tabBarDidClickPlusButton:)]){
        [self.delegate1 tabBarDidClickPlusButton:self];
    }
}

//这个方法可以抽取到 UIImage 的分类中
- (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
