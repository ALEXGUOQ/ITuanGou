//
//  TGDuckButton.m
//  ITuanGou
//
//  Created by wangtao on 14-5-15.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "TGDuckButton.h"

@implementation TGDuckButton

+(instancetype)button
{
    return [self buttonWithType:UIButtonTypeCustom];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1添加顶部的分割线
        _divider = [[UIImageView alloc]init];
        _divider.image = [UIImage imageNamed:@"separator_tabbar_item"];
        _divider.frame = CGRectMake(0, 0, ITGDockButtonW, 2);
        [self addSubview:_divider];
    }
    return self;
}
-(void)setFrame:(CGRect)frame
{
    //设置按钮的尺寸
    frame.size = CGSizeMake(ITGDockButtonW, ITGDockButtonH);
    [super setFrame:frame];
}
-(void)setBounds:(CGRect)bounds
{
    bounds.size =  CGSizeMake(ITGDockButtonW, ITGDockButtonH);
    [super setBounds:bounds];
    
}
@end
