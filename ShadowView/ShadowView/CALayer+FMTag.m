//
//  CALayer+FMTag.m
//  orangeMusic
//
//  Created by apple on 2019/12/25.
//  Copyright © 2019 apple. All rights reserved.
//

#import "CALayer+FMTag.h"
#import <objc/runtime.h>
static char * isLayOutEndKey = "isLayOutEndKey";
static char * bindViewKey = "bindViewKey";
@implementation CALayer (FMTag)
- (void)setTag:(NSInteger)tag {
    objc_setAssociatedObject(self,isLayOutEndKey,@(tag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSInteger)tag {
    return [objc_getAssociatedObject(self, isLayOutEndKey) integerValue];
}

- (void)setBindView:(UIView *)bindView {
    objc_setAssociatedObject(self,bindViewKey,bindView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)bindView {
    return objc_getAssociatedObject(self, bindViewKey);
}
@end
