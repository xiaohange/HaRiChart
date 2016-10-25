//
//  PCChartViewController.m
//  PNChartDemo
//
//  Created by HaRi on 18/10/16.
//  Copyright (c) 2016年 HaRi. All rights reserved.
//

#import "PCChartViewController.h"
#define ARC4RANDOM_MAX 0x100000000
#import "ZDCustomView.h"
@implementation PCChartViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.textColor = [UIColor blackColor];

 
    if ([self.title isEqualToString:@"Line Chart"]) {

        self.titleLabel.text = @"Line Chart";

        self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(20, 135.0, SCREEN_WIDTH-40, 200)];
        // x轴颜色要放在初始化最前面
        self.lineChart.xLabelColor = [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
        self.lineChart.yLabelColor = [UIColor redColor];
        self.lineChart.backgroundColor = [UIColor whiteColor];
        self.lineChart.yLabelFormat = @"%1.1f";
        [self.lineChart setXLabels:@[@"23",@"25",@"27",@"29",@"1",@"3",@"5",@"7"]];
        self.lineChart.showCoordinateAxis = YES;

        // 纵坐标全选虚线两种方式：
        // 方式1: 纵坐标哪个需要划虚线
        self.lineChart.ySliderArray = [NSMutableArray arrayWithArray:@[@"0",@"20",@"40",@"60",@"80",@"100",@"120"]];
        // 方式2: 全选绘制虚线:
        self.lineChart.yGridLinesColor = [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
        self.lineChart.showYGridLines = NO;
        
        //Use yFixedValueMax and yFixedValueMin to Fix the Max and Min Y Value
        //Only if you needed
        self.lineChart.yFixedValueMax = 120.0;
        self.lineChart.yFixedValueMin = 0.0;
        self.lineChart.yLabelNum = 7;
        

        [self.lineChart setYLabels:@[
            @"0",
            @"20",
            @"40",
            @"60",
            @"80",
            @"100",
            @"120"
            ]
         ];
  /*
        // Line Chart #1
        NSArray * data01Array = @[@20.0, @40, @60, @0, @20, @50, @60, @80];
      
        PNLineChartData *data01 = [PNLineChartData new];
//        data01.dataTitle = @"女款";
        data01.color = [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
        data01.alpha = 1.0f;
        data01.itemCount = data01Array.count;
        data01.inflexionPointColor = [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f]; // ⭕️颜色
        data01.inflexionPointStyle = PNLineChartPointStyleCircle;
        data01.getData = ^(NSUInteger index) {
            CGFloat yValue = [data01Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
 */
        // Line Chart #2
        NSMutableArray * data02Array = [NSMutableArray arrayWithArray: @[@40.0, @80.1, @26.4, @0, @0, @0, @45.2,@50]];
        self.lineChart.dataSource = [NSMutableArray arrayWithArray:data02Array];
        PNLineChartData *data02 = [PNLineChartData new];
        data02.dataTitle = @"Beta";
        data02.color = [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
        data02.alpha = 1.0f;
        data02.itemCount = data02Array.count;
        data02.inflexionPointColor = [UIColor colorWithRed:14.0f/255.0f green:110.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
        data02.inflexionPointStyle = PNLineChartPointStyleCircle;
        data02.getData = ^(NSUInteger index) {
            CGFloat yValue = [data02Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };

        
        self.lineChart.chartData = @[data02];
        [self.lineChart strokeChart];
        self.lineChart.delegate = self;
        
        [self.view addSubview:self.lineChart];
       

        self.lineChart.legendStyle = PNLegendItemStyleSerial;
        self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
//        self.lineChart.legendFontColor = [UIColor redColor];
        
//        UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
//        [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
//        [self.view addSubview:legend];
    }
}

- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    //NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    //NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}


@end
