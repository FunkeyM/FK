//
//  MLCircleProgressView.h
//  MeilanAPP
//
//  Created by FunKey on 2020/11/19.
//  Copyright © 2020 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKCircleProgressView : UIView


/// 宽度
@property (nonatomic, assign) CGFloat lineWidth;

/// 圆形颜色
@property (nonatomic, strong) UIColor *lineColor;

/// 底圆形颜色
@property (nonatomic, strong) UIColor *bgLineColor;

/// 0-1
@property (nonatomic, assign) CGFloat progress;

@end

NS_ASSUME_NONNULL_END
