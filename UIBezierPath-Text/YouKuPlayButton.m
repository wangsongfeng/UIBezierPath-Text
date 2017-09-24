//
//  YouKuPlayButton.m
//  UIBezierPath-Text
//
//  Created by apple on 2017/9/24.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "YouKuPlayButton.h"
//线条颜色
#define BLueColor [UIColor colorWithRed:62/255.0 green:157/255.0 blue:254/255.0 alpha:1]
#define LightBLueColor [UIColor colorWithRed:87/255.0 green:188/255.0 blue:253/255.0 alpha:1]
#define RedColor [UIColor colorWithRed:228/255.0 green:35/255.0 blue:6/255.0 alpha:0.8]
@interface YouKuPlayButton ()
{
    CAShapeLayer * leftLineLayer;
    CAShapeLayer * leftCircle;
    CAShapeLayer * rightLineLayer;
    CAShapeLayer * rightCircle;
    //三角播放按钮容器
    CALayer *_triangleCotainer;
}
@end

@implementation YouKuPlayButton

-(instancetype)initWithFrame:(CGRect)frame state:(YouKuPlayButtonState)states{
    if (self=[super initWithFrame:frame]) {
        [self buileUI];
        if (states==YouKuPlayButtonStatePlay) {
            self.buttonState = states;
        }
    }
    return self;
}

-(void)buileUI{
    [self addLeftCircle];
    [self addRightCircle];
//    [self adLeftLineLayer];
//    [self addRightLineLayer];
    [self addCenterTriangleLayer];
}
- (CGColorRef _Nonnull)extracted {
    return LightBLueColor.CGColor;
}
-(void)adLeftLineLayer{
    CGFloat a=self.layer.bounds.size.width;
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.2, a*0.9)];
    [path addLineToPoint:CGPointMake(a*0.2, a*0.1)];
    leftLineLayer=[CAShapeLayer layer];
    leftLineLayer.path=path.CGPath;
    leftLineLayer.fillColor=[UIColor clearColor].CGColor;
    leftLineLayer.strokeColor=BLueColor.CGColor;
    leftLineLayer.lineWidth=a*0.18;
    leftLineLayer.lineCap=kCALineCapRound;
    leftLineLayer.lineJoin=kCALineJoinRound;
    [self.layer addSublayer:leftLineLayer];

}
-(void)addLeftCircle{
    CGFloat a=self.layer.bounds.size.width;
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.2, a*0.9)];
    CGFloat startAngle = acos(4.0/5.0) + M_PI_2;
    CGFloat endAngle = startAngle - M_PI;
    [path addArcWithCenter:CGPointMake(a*0.5, a*0.5) radius:0.5*a startAngle:startAngle endAngle:endAngle clockwise:false];
    leftCircle=[CAShapeLayer layer];
    leftCircle.path=path.CGPath;
    leftCircle.fillColor=[UIColor clearColor].CGColor;
    leftCircle.strokeColor= [self extracted];
    leftCircle.lineWidth=a*0.18;
    leftCircle.lineCap=kCALineCapRound;
    leftCircle.lineJoin=kCALineJoinRound;
    [self.layer addSublayer:leftCircle];
}


/**
 添加右侧竖线层
 */
- (void)addRightLineLayer {
    
    CGFloat a = self.layer.bounds.size.width;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.8,a*0.1)];
    [path addLineToPoint:CGPointMake(a*0.8,a*0.9)];
    
    rightLineLayer = [CAShapeLayer layer];
    rightLineLayer.path = path.CGPath;
    rightLineLayer.fillColor = [UIColor clearColor].CGColor;
    rightLineLayer.strokeColor = BLueColor.CGColor;
    rightLineLayer.lineWidth = a*0.18;
    rightLineLayer.lineCap = kCALineCapRound;
    rightLineLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:rightLineLayer];
}
/**
 添加左侧圆弧
 */

- (void)addRightCircle {
    
    CGFloat a = self.layer.bounds.size.width;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.8,a*0.1)];
    CGFloat startAngle = -asin(4.0/5.0);
    CGFloat endAngle = startAngle - M_PI;
    [path addArcWithCenter:CGPointMake(a*0.5, a*0.5) radius:0.5*a startAngle:startAngle endAngle:endAngle clockwise:false];
    
    
    rightCircle = [CAShapeLayer layer];
    rightCircle.path = path.CGPath;
    rightCircle.fillColor = [UIColor clearColor].CGColor;
    rightCircle.strokeColor =LightBLueColor.CGColor;
    rightCircle.lineWidth = [self lineWidth];
    rightCircle.lineCap = kCALineCapRound;
    rightCircle.lineJoin = kCALineJoinRound;
//    rightCircle.strokeEnd = 0;
    [self.layer addSublayer:rightCircle];
}
/**
 添加左侧三角 由两个直线组成
 */
- (void)addCenterTriangleLayer {
    CGFloat a = self.layer.bounds.size.width;
    
    _triangleCotainer = [CALayer layer];
    _triangleCotainer.bounds = CGRectMake(0, 0, 0.4*a, 0.35*a);
    _triangleCotainer.position = CGPointMake(a*0.5, a*0.55);
//    _triangleCotainer.opacity = 0;
    [self.layer addSublayer:_triangleCotainer];
    
    CGFloat b = _triangleCotainer.bounds.size.width;
    CGFloat c = _triangleCotainer.bounds.size.height;
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0,0)];
    [path1 addLineToPoint:CGPointMake(b/2,c)];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(b,0)];
    [path2 addLineToPoint:CGPointMake(b/2,c)];
    
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.path = path1.CGPath;
    layer1.fillColor = [UIColor clearColor].CGColor;
    layer1.strokeColor = RedColor.CGColor;
    layer1.lineWidth = a*0.18;
    layer1.lineCap = kCALineCapRound;
    layer1.lineJoin = kCALineJoinRound;
    layer1.strokeEnd = 1;
    [_triangleCotainer addSublayer:layer1];
    
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = path2.CGPath;
    layer2.fillColor = [UIColor clearColor].CGColor;
    layer2.strokeColor = RedColor.CGColor;
    layer2.lineWidth =a*0.18;
    layer2.lineCap = kCALineCapRound;
    layer2.lineJoin = kCALineJoinRound;
    layer2.strokeEnd = 1;
    [_triangleCotainer addSublayer:layer2];
}
//线条宽度，根据按钮的宽度按比例设置
- (CGFloat)lineWidth {
    return self.layer.bounds.size.width * 0.18;
}
@end
