//
//  TGDuckButton.h
//  ITuanGou
//
//  Created by wangtao on 14-5-15.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//  左侧按钮的顶层父类

#import <UIKit/UIKit.h>

@interface TGDuckButton : UIButton
{
    UIImageView *_divider;
}
+(instancetype)button;
@end
