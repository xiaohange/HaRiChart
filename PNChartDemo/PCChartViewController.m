//
//  PCChartViewController.m
//  PNChartDemo
//
//  Created by kevin on 11/7/13.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
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
        self.lineChart.backgroundColor = [UIColor yellowColor];
        self.lineChart.yLabelFormat = @"%1.1f";
        [self.lineChart setXLabels:@[@"23",@"25",@"27",@"29",@"1",@"3",@"5"]];
        self.lineChart.showCoordinateAxis = YES;
        

        // added an examle to show how yGridLines can be enabled
        // the color is set to clearColor so that the demo remains the same
        self.lineChart.yGridLinesColor = [UIColor clearColor];
        self.lineChart.showYGridLines = YES;
        
        //Use yFixedValueMax and yFixedValueMin to Fix the Max and Min Y Value
        //Only if you needed
        self.lineChart.yFixedValueMax = 120.0;
        self.lineChart.yFixedValueMin = 0.0;

        [self.lineChart setYLabels:@[
            @"0",
            @"20",
            @"40",
            @"60",
            @"80",
            @"100",
            @"120",
            ]
         ];
        
        // Line Chart #1
        NSArray * data01Array = @[@20.0, @40, @60, @20, @50, @60, @80,];
        PNLineChartData *data01 = [PNLineChartData new];
//        data01.dataTitle = @"女款";
        data01.color = [UIColor greenColor];
        data01.alpha = 1.0f;
        data01.itemCount = data01Array.count;
        data01.inflexionPointColor = [UIColor redColor]; // ⭕️颜色
        data01.inflexionPointStyle = PNLineChartPointStyleCircle;
        data01.getData = ^(NSUInteger index) {
            CGFloat yValue = [data01Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        // Line Chart #2
        NSArray * data02Array = @[@40.0, @80.1, @26.4, @10.2, @70.2, @47.2, @45.2];
        PNLineChartData *data02 = [PNLineChartData new];
        data02.dataTitle = @"Beta";
        data02.color = [UIColor greenColor];
        data02.alpha = 1.0f;
        data02.itemCount = data02Array.count;
        data02.inflexionPointColor = [UIColor blackColor];
        data02.inflexionPointStyle = PNLineChartPointStyleCircle;
        data02.getData = ^(NSUInteger index) {
            CGFloat yValue = [data02Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };

        self.lineChart.chartData = @[data01,data02];
        [self.lineChart strokeChart];
        self.lineChart.delegate = self;
        
        [self.view addSubview:self.lineChart];

        self.lineChart.legendStyle = PNLegendItemStyleSerial;
        self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
        self.lineChart.legendFontColor = [UIColor redColor];
        
//        UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
//        [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
//        [self.view addSubview:legend];
        
        
        
        ZDCustomView *view = [[ZDCustomView alloc]initWithFrame:CGRectMake(0, 400, SCREEN_WIDTH, 1)];
        view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view];

    }
}

- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
    
}

- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    //NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    //NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}


@end
