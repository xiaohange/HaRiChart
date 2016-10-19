//
// Created by HaRi on 18/10/16.
// Copyright (c) 2016 HaRi. All rights reserved.
//

#import "PNLineChartData.h"

@implementation PNLineChartData

- (id)init
{
    self = [super init];
    if (self) {
        [self setupDefaultValues];
    }
    
    return self;
}

- (void)setupDefaultValues
{
    _inflexionPointStyle = PNLineChartPointStyleNone;
    _inflexionPointWidth = 6.f;
    _lineWidth = 1.f;
    _alpha = 1.f;
    _showPointLabel = NO;
    _pointLabelColor = [UIColor blackColor];
    _pointLabelFormat = @"%1.f";
}

@end
