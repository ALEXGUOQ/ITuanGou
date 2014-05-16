//
//  TGTabButton.m
//  ITuanGou
//
//  Created by wangtao on 14-5-16.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "TGTabButton.h"

@implementation TGTabButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置选中按钮时的图片
        [self setBackgroundImage:[UIImage imageNamed:@"bg_tabbar_item"] forState:UIControlStateSelected];
    }
    return self;
}
-(void)setHighlighted:(BOOL)highlighted
{
}
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    //上面的选项卡按钮在选中的时候隐藏上面的线
    _divider.hidden = selected;
}

@end
