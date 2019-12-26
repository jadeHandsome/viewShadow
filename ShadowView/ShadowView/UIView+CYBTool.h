//
//  UIView+CYBTool.h
//  Minivideo
//
//  Created by 曾洪磊 on 2019/2/18.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CALayer+FMTag.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIView (CYBTool)
/*
 * 是否需要阴影
 **/
@property (nonatomic, assign) BOOL shadowEnabel;
/*
 * 阴影颜色 不设置默认view背景色
 **/
@property (nonatomic, strong) UIColor *shadowColor;
/*
 * 阴影圆角 不设置默认view的layer的圆角数
 **/
@property (nonatomic, assign) CGFloat shadowRadius;
- (void)addshadow;
@end

NS_ASSUME_NONNULL_END
