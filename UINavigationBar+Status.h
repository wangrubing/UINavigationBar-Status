//
//  UINavigationBar+Status.h
//  状态栏2
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 wrb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Status)
@property (nonatomic, weak) UIView *backgroundView;
-(void)nav_setBackgroundColor:(UIColor *)backgroundColor offsetY:(CGFloat)offsetY;
-(void)nav_clean;
@end
