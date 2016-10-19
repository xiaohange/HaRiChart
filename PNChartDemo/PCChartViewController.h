//
//  PCChartViewController.h
//  PNChartDemo
//
//  Created by HaRi on 18/10/16.
//  Copyright (c) 2016年 HaRi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNChart.h"
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)

@interface PCChartViewController : UIViewController<PNChartDelegate>

@property (nonatomic) PNLineChart * lineChart;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
