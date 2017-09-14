//
//  CAShapeLayerAndUIBzerPath.m
//  UIBezierPath-Text
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "CAShapeLayerAndUIBzerPath.h"

@interface CAShapeLayerAndUIBzerPath ()

@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,strong)CAShapeLayer * shapeLayer;

@end
@implementation CAShapeLayerAndUIBzerPath

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _shapeLayer =[CAShapeLayer layer];
        _shapeLayer.frame=CGRectMake(0, 0, 200, 200);
        _shapeLayer.position=self.center;
        _shapeLayer.backgroundColor=[UIColor blackColor].CGColor;
        _shapeLayer.path=[self getStart1Path].CGPath;
        _shapeLayer.fillColor=[UIColor clearColor].CGColor;
        _shapeLayer.strokeColor=[UIColor redColor].CGColor;
        _shapeLayer.lineWidth=2.0f;
        [self.layer addSublayer:_shapeLayer];
        
        _timer=[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(pathAnimation) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)pathAnimation{
    static int i=0;
    if (i++ % 2==0) {
        CABasicAnimation * animation=[CABasicAnimation animationWithKeyPath:@"path"];
        animation.removedOnCompletion=NO;
        animation.duration=1;
        animation.fromValue=(__bridge id)[self getStart1Path].CGPath;
        animation.toValue=(__bridge id)[self getStart2Path].CGPath;
        
        _shapeLayer.path=[self getStart2Path].CGPath;
        [_shapeLayer addAnimation:animation forKey:@"animateCirclePath"];
    }else{
        CABasicAnimation * animation=[CABasicAnimation animationWithKeyPath:@"path"];
        animation.removedOnCompletion=NO;
        animation.duration=1;
        animation.fromValue=(__bridge id)[self getStart2Path].CGPath;
        animation.toValue=(__bridge id)[self getStart1Path].CGPath;
        
        _shapeLayer.path=[self getStart1Path].CGPath;
        [_shapeLayer addAnimation:animation forKey:@"animateCirclePath"];

    }
}

//贝塞尔曲线 1
-(UIBezierPath*)getStart1Path{
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(22.5, 2.5)];
    [path addLineToPoint:CGPointMake(28.32, 14.49)];
    [path addLineToPoint:CGPointMake(41.52, 16.32)];
    [path addLineToPoint:CGPointMake(31.92, 25.56)];
    [path addLineToPoint:CGPointMake(34.26, 38.68)];
    [path addLineToPoint:CGPointMake(22.5, 32.4)];
    [path addLineToPoint:CGPointMake(10.74, 38.68)];
    [path addLineToPoint:CGPointMake(13.08, 25.56)];
    [path addLineToPoint:CGPointMake(3.48, 16.32)];
    [path addLineToPoint:CGPointMake(16.68, 14.49)];
    [path closePath];
    
    return path;
}

//贝塞尔曲线 2
-(UIBezierPath*)getStart2Path{
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(22.5, 2.5)];
    [path addLineToPoint:CGPointMake(32.15, 9.21)];
    [path addLineToPoint:CGPointMake(41.52, 16.32)];
    [path addLineToPoint:CGPointMake(38.12, 27.57)];
    [path addLineToPoint:CGPointMake(34.26, 38.68)];
    [path addLineToPoint:CGPointMake(22.5, 38.92)];
    [path addLineToPoint:CGPointMake(10.74, 38.68)];
    [path addLineToPoint:CGPointMake(6.88, 27.57)];
    [path addLineToPoint:CGPointMake(3.48, 16.32)];
    [path addLineToPoint:CGPointMake(12.85, 9.12)];
    [path closePath];
    
    return path;
}

@end
