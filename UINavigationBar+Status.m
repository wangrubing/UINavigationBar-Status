//
//  UINavigationBar+Status.m
//  状态栏2
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 wrb. All rights reserved.
//

#import "UINavigationBar+Status.h"
#import <objc/runtime.h>

const char key;

@implementation UINavigationBar (Status)

-(void)setBackgroundView:(UIView *)backgroundView
{
    objc_setAssociatedObject(self, &key, backgroundView, OBJC_ASSOCIATION_ASSIGN);
}

-(UIView *)backgroundView
{
    return objc_getAssociatedObject(self, &key);
}

-(void)nav_setBackgroundColor:(UIColor *)backgroundColor offsetY:(CGFloat)offsetY
{
    if (offsetY > 50)
    {
        CGFloat alpha = 1 - (100 - offsetY)/50;
        [self nav_setBackgroundColor:[backgroundColor colorWithAlphaComponent:alpha]];
    }
    else
    {
        [self nav_setBackgroundColor:[backgroundColor colorWithAlphaComponent:0]];
    }
}

-(void)nav_setBackgroundColor:(UIColor *)backgroundColor
{
    if (self.backgroundView == nil)
    {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.frame = CGRectMake(0, -20, 375, 64);
        [self insertSubview:backgroundView atIndex:0];
        self.backgroundView = backgroundView;
    }
    
    self.backgroundView.backgroundColor = backgroundColor;}

-(void)nav_clean
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
}
@end
