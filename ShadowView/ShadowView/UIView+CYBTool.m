//
//  UIView+CYBTool.m
//  Minivideo
//
//  Created by 曾洪磊 on 2019/2/18.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import "UIView+CYBTool.h"
#import <objc/runtime.h>
@implementation UIView (CYBTool)
static char * shadowRadiusKey = "shadowRadiusKey";
static char * shadowColorKey = "shadowColorKey";
static char * shadowEnabelKey = "shadowEnabelKey";
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /** 获取原始初始化方法 */
        Method originalM = class_getInstanceMethod([self class], @selector(layoutSubviews));
        /** 获取自定义的初始化方法 */
        Method exchangeM = class_getInstanceMethod([self class], @selector(fm_layoutSubviews));
        /** 交换方法 */
        method_exchangeImplementations(originalM, exchangeM);
    });
}
- (void)fm_layoutSubviews {
    [self fm_layoutSubviews];
    for (UIView *sub in self.subviews) {
        if (sub.shadowEnabel && sub != self) {
            [sub addshadow];
        }
    }
}
- (void)addshadow {
    NSArray *arr = self.superview.layer.sublayers;
    for (int i = 0; i < arr.count; i ++) {
        if ([arr[i] tag] == 200000 && [arr[i] bindView] == self) {
            [arr[i] removeFromSuperlayer];
        }
    }
    CALayer *subLayer = [CALayer layer];
    CGRect fixframe = self.frame;
    subLayer.frame = fixframe;
    subLayer.cornerRadius = self.layer.cornerRadius;
    subLayer.backgroundColor = self.backgroundColor.CGColor;
    subLayer.masksToBounds = NO;
    subLayer.tag = 200000;
    subLayer.bindView = self;
    if (self.shadowColor) {
        subLayer.shadowColor = self.shadowColor.CGColor;//shadowColor阴影颜色
    } else {
        subLayer.shadowColor = self.backgroundColor.CGColor;//shadowColor阴影颜色
    }
    subLayer.shadowOffset = CGSizeMake(4,4);
    if (self.shadowRadius == 0) {
        subLayer.shadowRadius = self.layer.shadowRadius;//
    } else {
        subLayer.shadowRadius = self.shadowRadius;//
    }
    subLayer.shadowOpacity = 0.8;//阴影透明度，默认0
    [self.superview.layer insertSublayer:subLayer below:self.layer];
}
- (void)willRemoveSubview:(UIView *)subview {
    NSArray *arr = self.superview.layer.sublayers;
    CALayer *layer = nil;
    for (int i = 0; i < arr.count; i ++) {
        if ([arr[i] tag] == 200000) {
            layer = arr[i];
        }
    }
    if (layer) {
        if (layer.bindView == subview) {
            [layer removeFromSuperlayer];
        }
    }
}
- (void)setShadowRadius:(CGFloat)shadowRadius {
    objc_setAssociatedObject(self,shadowRadiusKey,@(shadowRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)shadowRadius {
    return [objc_getAssociatedObject(self, shadowRadiusKey) floatValue];
}

- (void)setShadowColor:(UIColor *)shadowColor {
    objc_setAssociatedObject(self,shadowColorKey,shadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)shadowColor {
    return objc_getAssociatedObject(self, shadowColorKey);
}

- (void)setShadowEnabel:(BOOL)shadowEnabel {
    objc_setAssociatedObject(self,shadowEnabelKey,@(shadowEnabel), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)shadowEnabel {
    return [objc_getAssociatedObject(self, shadowEnabelKey) boolValue];
}
@end
