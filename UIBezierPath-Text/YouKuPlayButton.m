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
    BOOL _isAnimating;

}
@end
static CGFloat animationDuration = 0.35f;
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
    [self adLeftLineLayer];
    [self addRightLineLayer];
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
    leftLineLayer.lineWidth=[self lineWidth];
    leftLineLayer.lineCap=kCALineCapRound;
    leftLineLayer.lineJoin=kCALineJoinRound;
    [self.layer addSublayer:leftLineLayer];

}
-(void)addLeftCircle{
    CGFloat a=self.layer.bounds.size.width;
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.2, a*0.9)];
    CGFloat startAngle = acos(4.0/5.0)+M_PI_2;
    CGFloat endAngle = startAngle - M_PI;
    [path addArcWithCenter:CGPointMake(a*0.5, a*0.5) radius:0.5*a startAngle:startAngle endAngle:endAngle clockwise:false];
    leftCircle=[CAShapeLayer layer];
    leftCircle.path=path.CGPath;
    leftCircle.fillColor=[UIColor clearColor].CGColor;
    leftCircle.strokeColor= [self extracted];
    leftCircle.lineWidth= [self lineWidth];
    leftCircle.lineCap=kCALineCapRound;
    leftCircle.lineJoin=kCALineJoinRound;
    leftCircle.strokeEnd=0;
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
    rightLineLayer.lineWidth = [self lineWidth];
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
    rightCircle.strokeEnd = 0;
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
    _triangleCotainer.opacity = 0;
    _triangleCotainer.backgroundColor=[UIColor clearColor].CGColor;
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
    layer1.lineWidth =[self lineWidth];
    layer1.lineCap = kCALineCapRound;
    layer1.lineJoin = kCALineJoinRound;
    layer1.strokeEnd = 1;
    [_triangleCotainer addSublayer:layer1];
    
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = path2.CGPath;
    layer2.fillColor = [UIColor clearColor].CGColor;
    layer2.strokeColor = RedColor.CGColor;
    layer2.lineWidth =[self lineWidth];
    layer2.lineCap = kCALineCapRound;
    layer2.lineJoin = kCALineJoinRound;
    layer2.strokeEnd = 1;
    [_triangleCotainer addSublayer:layer2];
}
//线条宽度，根据按钮的宽度按比例设置
- (CGFloat)lineWidth {
    return self.layer.bounds.size.width * 0.18;
}

#pragma mark 旋转动画

-(void)actionRotateAnimationWith:(BOOL)clockwise{
    //逆时针旋转
    CGFloat startAngle=0.0;
    
    CGFloat endAngle=-M_PI_2;
    
    CGFloat duration=0.75*animationDuration;
    
    if (clockwise) {
        startAngle = -M_PI_2;
        endAngle=0.0;
        duration= animationDuration;
    }
    
    CABasicAnimation * animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration=duration;
    animation.fromValue=[NSNumber numberWithFloat:startAngle];
    animation.toValue=[NSNumber numberWithFloat:endAngle];
    
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion=NO;
    [animation setValue:@"roateAnimation" forKey:@"animationName"];
    [self.layer addAnimation:animation forKey:nil];
}
#pragma make 三角旋转动画，类似于  一闪一闪的星星闪烁
-(void)actionTringAlphaAnimationform:(CGFloat)form to:(CGFloat)toValua duation:(CGFloat)dutation{
    CABasicAnimation * animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration=dutation;
    animation.fromValue=@(form);
    animation.toValue=@(toValua);
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion=NO;
    [animation setValue:@"alphaAnimation" forKey:@"animationName"];
    [_triangleCotainer addAnimation:animation forKey:nil];
}

-(void)setButtonState:(YouKuPlayButtonState)buttonState{
    if (_isAnimating==YES) {
        return;
    }
    _buttonState=buttonState;
    _isAnimating=YES;
    if (buttonState==YouKuPlayButtonStatePlay) {
        [self showPlayAnimation];
    }else if (buttonState==YouKuPlayButtonStatePause){
        [self showPauseAnimation];
    }
    
    //更新动画执行状态
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  (animationDuration) * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        _isAnimating = false;
    });
}
/**
 通用执行strokeEnd动画
 */
- (CABasicAnimation *)strokeEndAnimationFrom:(CGFloat)fromValue to:(CGFloat)toValue onLayer:(CALayer *)layer name:(NSString*)animationName duration:(CGFloat)duration delegate:(id)delegate {
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = duration;
    strokeEndAnimation.fromValue = @(fromValue);
    strokeEndAnimation.toValue = @(toValue);
    strokeEndAnimation.fillMode = kCAFillModeForwards;
    strokeEndAnimation.removedOnCompletion = NO;
    [strokeEndAnimation setValue:animationName forKey:@"animationName"];
    strokeEndAnimation.delegate = delegate;
    [layer addAnimation:strokeEndAnimation forKey:nil];
    return strokeEndAnimation;
}
-(void)showPlayAnimation{
    
    //收直线、放圆圈；直线的速度是圆圈的2倍
    [self strokeEndAnimationFrom:1 to:0 onLayer:leftLineLayer name:nil duration:animationDuration/2 delegate:nil];
    [self strokeEndAnimationFrom:1 to:0 onLayer:rightLineLayer name:nil duration:animationDuration/2 delegate:nil];
    [self strokeEndAnimationFrom:0 to:1 onLayer:leftCircle name:nil duration:animationDuration delegate:nil];
    [self strokeEndAnimationFrom:0 to:1 onLayer:rightCircle name:nil duration:animationDuration delegate:nil];
    //开始旋转动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  animationDuration/4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        [self actionRotateAnimationWith:NO];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animationDuration/2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self actionTringAlphaAnimationform:0 to:1 duation:animationDuration/2];
    });
}
-(void)showPauseAnimation{
    //先收圆圈，
    [self strokeEndAnimationFrom:1 to:0 onLayer:leftCircle name:nil duration:animationDuration delegate:nil];
    [self strokeEndAnimationFrom:1 to:0 onLayer:rightCircle name:nil duration:animationDuration delegate:nil];
    //旋转动画
    [self actionRotateAnimationWith:YES];
    //隐藏播放三角动画
    [self actionTringAlphaAnimationform:1 to:0 duation:animationDuration/2];
    //收到一半再放直线
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  animationDuration/2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        [self strokeEndAnimationFrom:0 to:1 onLayer:leftLineLayer name:nil duration:animationDuration/2 delegate:nil];
        [self strokeEndAnimationFrom:0 to:1 onLayer:rightLineLayer name:nil duration:animationDuration/2 delegate:nil];
    });

}
@end
