//
//  TGMoreButton.m
//  ITuanGou
//
//  Created by wangtao on 14-5-16.
//  Copyright (c) 2014年 JobsTech. All rights reserved.
//

#import "TGMoreButton.h"

@implementation TGMoreButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self setImage:[UIImage imageNamed:@"ic_more"] forState:UIControlStateNormal];
    }
    return self;
}


@end
