//
//  PCChartViewController.h
//  PNChartDemo
//
//  Created by kevin on 11/7/13.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNChart.h"
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)

@interface PCChartViewController : UIViewController<PNChartDelegate>

@property (nonatomic) PNLineChart * lineChart;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
