//
//  CALayer+FMTag.h
//  orangeMusic
//
//  Created by apple on 2019/12/25.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (FMTag)
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, strong) UIView *bindView;
@end

NS_ASSUME_NONNULL_END
