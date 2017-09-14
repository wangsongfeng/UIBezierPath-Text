//
//  ViewController.m
//  UIBezierPath-Text
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "ViewController.h"
#import "TextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    TextView * textView=[[TextView alloc]initWithFrame:self.view.bounds];
    textView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:textView];
}
//创建一个五边形
-(void)oneText{
    
    UIColor * color=[UIColor redColor];
    
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


-(void)twoText{
   
}
@end
