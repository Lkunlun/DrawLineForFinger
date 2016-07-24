//
//  ViewController.m
//  DrawLineForFinger
//
//  Created by hankielao on 16/7/24.
//  Copyright © 2016年 hankielao. All rights reserved.
//

#import "ViewController.h"
#import "DrawLineView.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *pointArray;
@property (nonatomic ,assign) BOOL isFirst;

@property (nonatomic, assign) CGPoint lineStartPoint;
@property (nonatomic, assign) CGPoint lineEndPoint;

@property (nonatomic, strong) DrawLineView *drawview;

@end

@implementation ViewController
- (NSMutableArray *)pointArray
{
    if (!_pointArray) {
        _pointArray = [NSMutableArray new];
    }
    return _pointArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isFirst = YES;
    _drawview = [[DrawLineView alloc] initWithFrame:self.view.bounds];
    _drawview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_drawview];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_isFirst) {
        self.lineStartPoint= [touches.anyObject locationInView:self.view];
        [self.pointArray addObject:[NSValue valueWithCGPoint:self.lineStartPoint]];
        _drawview.array = _pointArray;
    }
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.lineEndPoint = [touches.anyObject locationInView:self.view];
    [self.pointArray addObject:[NSValue valueWithCGPoint:self.lineEndPoint]];
    _drawview.array = _pointArray;
    //刷新
    [_drawview setNeedsDisplay];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //如果禁用，可以连续划屏幕
    [self.pointArray removeAllObjects];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
