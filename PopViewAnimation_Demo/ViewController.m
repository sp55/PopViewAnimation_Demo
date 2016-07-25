//
//  ViewController.m
//  PopViewAnimation_Demo
//
//  Created by admin on 16/7/25.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/b21e013bdd05
//点击弹出view放大带弹簧效果的动画

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testView =[[UIView alloc] initWithFrame:CGRectMake(80, 200, 100, 100)];
    self.testView.backgroundColor =[UIColor redColor];
    [self.view addSubview:self.testView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self animationAlert:self.testView];
}
-(void) animationAlert:(UIView *)view
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.testView.layer addAnimation:popAnimation forKey:nil];
    
}



@end
