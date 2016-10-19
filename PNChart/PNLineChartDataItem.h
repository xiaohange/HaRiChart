//
// Created by HaRi on 18/10/16.
// Copyright (c) 2016 HaRi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PNLineChartDataItem : NSObject

+ (PNLineChartDataItem *)dataItemWithY:(CGFloat)y;
+ (PNLineChartDataItem *)dataItemWithY:(CGFloat)y andRawY:(CGFloat)rawY;

@property (readonly) CGFloat y; // should be within the y range
@property (readonly) CGFloat rawY; // this is the raw value, used for point label.

@end
