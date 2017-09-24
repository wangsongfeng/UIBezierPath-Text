//
//  YouKuPlayButton.h
//  UIBezierPath-Text
//
//  Created by apple on 2017/9/24.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YouKuPlayButtonState){
    YouKuPlayButtonStatePause=0,
    YouKuPlayButtonStatePlay
};
@interface YouKuPlayButton : UIButton

@property(nonatomic,assign)YouKuPlayButtonState  buttonState;

-(instancetype)initWithFrame:(CGRect)frame state:(YouKuPlayButtonState)states;

@end
