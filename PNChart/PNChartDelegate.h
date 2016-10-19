//
//  PNChartDelegate.h
//  PNChartDemo
//
//  Created by HaRi on 18-10-16.
//  Copyright (c) 2016年 HaRi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PNChartDelegate <NSObject>
@optional
/**
 * Callback method that gets invoked when the user taps on the chart line.
 */
- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex;

/**
 * Callback method that gets invoked when the user taps on a chart line key point.
 */
- (void)userClickedOnLineKeyPoint:(CGPoint)point
                        lineIndex:(NSInteger)lineIndex
                       pointIndex:(NSInteger)pointIndex;

@end
