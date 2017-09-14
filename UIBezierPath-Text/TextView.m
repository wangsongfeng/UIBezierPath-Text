//
//  TextView.m
//  UIBezierPath-Text
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "TextView.h"

@implementation TextView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
//    [self textOne];
//    [self textTwo];
//    [self textThree];
    [self textFour];

}

//创建一个五边形
-(void)oneText{
    
    UIBezierPath * path=[UIBezierPath bezierPath];
    path.lineWidth=5.0;
    path.lineCapStyle=kCGLineCapRound;//线条处理
    path.lineJoinStyle=kCGLineCapRound;//终点处理
    
    [path moveToPoint:CGPointMake(100.0, 0)];
    
    [path addLineToPoint:CGPointMake(200.0, 40.0)];
    [path addLineToPoint:CGPointMake(160.0, 140.0)];
    [path addLineToPoint:CGPointMake(40.0, 140.0)];
    [path addLineToPoint:CGPointMake(0.0, 40.0)];
    
    [path closePath];
    
}

//今日头条 刷新 动画图片
-(void)textOne{
    CGAffineTransform transform = CGAffineTransformMakeTranslation((self.bounds.size.width-50*5)/2, 100);
    transform = CGAffineTransformScale(transform, 5, 5);
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:10];
    [path1 applyTransform:transform];
    [[UIColor colorWithRed:198/255.0f green:198/255.0f blue:198/255.0f alpha:1.0f] setStroke];
    [path1 stroke];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path2 applyTransform:transform];
    [[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0f] setFill];
    [path2 fill];
    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path3 applyTransform:transform];
    [[UIColor colorWithRed:189/255.0f green:189/255.0f blue:189/255.0f alpha:1.0f] setStroke];
    [path3 stroke];
    
    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(28, 10)];
    [path11 addLineToPoint:CGPointMake(43, 10)];
    [path11 applyTransform:transform];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path11 stroke];
    
    UIBezierPath *path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:CGPointMake(28, 16)];
    [path12 addLineToPoint:CGPointMake(43, 16)];
    [path12 applyTransform:transform];
    [path12 stroke];
    
    UIBezierPath *path13 = [UIBezierPath bezierPath];
    [path13 moveToPoint:CGPointMake(28, 22)];
    [path13 addLineToPoint:CGPointMake(43, 22)];
    [path13 applyTransform:transform];
    [path13 stroke];
    
    UIBezierPath *path21 = [UIBezierPath bezierPath];
    [path21 moveToPoint:CGPointMake(7, 28)];
    [path21 addLineToPoint:CGPointMake(43, 28)];
    [path21 applyTransform:transform];
    [path21 stroke];
    
    UIBezierPath *path22 = [UIBezierPath bezierPath];
    [path22 moveToPoint:CGPointMake(7, 34)];
    [path22 addLineToPoint:CGPointMake(43, 34)];
    [path22 applyTransform:transform];
    [path22 stroke];
    
    UIBezierPath *path23 = [UIBezierPath bezierPath];
    [path23 moveToPoint:CGPointMake(7, 40)];
    [path23 addLineToPoint:CGPointMake(43, 40)];
    [path23 applyTransform:transform];
    [path23 stroke];

}


//二次贝塞尔曲线
-(void)textTwo{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(20, 100)];//初始位置
    /* CurveToPoint :终点的位置
     * controlPoint :可以控制 曲线的形状
     **/
    [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(20, 0)];
    
    [aPath stroke];
}
//三次贝塞尔曲线
-(void)textThree{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(20, 50)];
    
    [aPath addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 100)];
    
    [aPath stroke];
}
//5、使用UIBezierPath创建一段弧线
-(void)textFour{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:M_PI
                                                      clockwise:YES];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath stroke];
}
@end
