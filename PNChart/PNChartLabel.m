//
//  PNChartLabel.m
//  PNChart
//
//  Created by HaRi on 18/10/16.
//  Copyright (c) 2016年 HaRi. All rights reserved.
//

#import "PNChartLabel.h"

@implementation PNChartLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.font                      = [UIFont boldSystemFontOfSize:11.0f];
        self.backgroundColor           = [UIColor clearColor];
        self.textAlignment             = NSTextAlignmentRight;
        self.userInteractionEnabled    = YES;
        self.adjustsFontSizeToFitWidth = YES;
        self.numberOfLines             = 0;
        /* if you want to see ... in large labels un-comment this line
        self.minimumScaleFactor        = 0.8;
        */
    }

    return self;
}

@end
