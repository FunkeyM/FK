//
//  MLCircleProgressView.m
//  MeilanAPP
//
//  Created by FunKey on 2020/11/19.
//  Copyright © 2020 ios. All rights reserved.
//

#import "FKCircleProgressView.h"

@interface FKCircleProgressView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) CAShapeLayer *bgShapeLayer;

@end

@implementation FKCircleProgressView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _lineColor = UIColor.blueColor;
        _shapeLayer = [[CAShapeLayer alloc] init];
        _bgShapeLayer = [[CAShapeLayer alloc] init];
        _lineWidth = 5;
    }
    
    return self;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)setBgLineColor:(UIColor *)bgLineColor{
    _bgLineColor = bgLineColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (!_bgShapeLayer) {
        _bgShapeLayer = [[CAShapeLayer alloc] init];
        _bgShapeLayer.frame = rect;
    }else{
        [_bgShapeLayer removeFromSuperlayer];
        _bgShapeLayer = nil;
        _bgShapeLayer = [[CAShapeLayer alloc] init];
        _bgShapeLayer.frame = rect;
    }
    
    //路径
    if (!_shapeLayer) {
        _shapeLayer = [[CAShapeLayer alloc] init];
        _shapeLayer.frame = rect;
    }else{
        [_shapeLayer removeFromSuperlayer];
        _shapeLayer = nil;
        _shapeLayer = [[CAShapeLayer alloc] init];
        _shapeLayer.frame = rect;
    }
    //半径
    CGFloat radius = (MIN(rect.size.width, rect.size.height) - self.lineWidth) * 0.5;
    
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    bgPath.lineWidth = self.lineWidth;
    bgPath.lineCapStyle = kCGLineCapRound;
    bgPath.lineJoinStyle = kCGLineJoinRound;
    
    [bgPath stroke];
    self.bgShapeLayer.path = bgPath.CGPath;
    self.bgShapeLayer.strokeColor = self.bgLineColor.CGColor;
    self.bgShapeLayer.fillColor = UIColor.clearColor.CGColor;
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    //线宽
    path.lineWidth = _lineWidth;
    //颜色
    [self.lineColor set];
    //拐角
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
 
    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    [path addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI * 2 * _progress clockwise:YES];
    //连线
    [path stroke];
    _shapeLayer.path = path.CGPath;
}



@end
