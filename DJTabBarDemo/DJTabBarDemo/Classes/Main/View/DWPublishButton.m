//
//  DWPublishButton.m
//  DWCustomTabBarDemo
//
//  Created by Damon on 10/20/15.
//  Copyright © 2015 damonwong. All rights reserved.
//

#import "DWPublishButton.h"
#import "UIView+Extension.h"
@interface DWPublishButton ()<UIActionSheetDelegate>

@end

@implementation DWPublishButton


#pragma mark -
#pragma mark - Private Methods

//上下结构的 button
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    if (imageSize.width != 0 && imageSize.height != 0) {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 5 - titleSize.height - imageSize.height / 2 - 5;
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
    } else {
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        self.imageView.center = imageViewCenter;
    }
    
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 6 - titleSize.height / 2);
    self.titleLabel.center = labelCenter;
    
}

#pragma mark -
#pragma mark - Life Cycle

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.adjustsImageWhenHighlighted = NO;
        [self setTitle:@"发布" forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:9.5];
        [self sizeToFit];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Public Methods

+(instancetype)publishButton{
    return [[self alloc]init];
}



@end
