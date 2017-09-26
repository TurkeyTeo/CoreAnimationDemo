//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by Thinkive on 2017/9/25.
//  Copyright © 2017年 Teo. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    layer.frame = CGRectMake(0, 0, 100, 100);
    [self.view.layer addSublayer:layer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        layer.frame = CGRectOffset(layer.frame, 0, 100);
    });
    
    
    UIView *demo = [UIView new];
    demo.backgroundColor = [UIColor redColor];
    demo.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:demo];
    
//  1.  CABasicAnimation(基础动画)
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    animation1.duration = 1.;
//    如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
//    animation1.fillMode = kCAFillModeForwards;
//    animation1.removedOnCompletion = NO;
    [demo.layer addAnimation:animation1 forKey:@"demoPosition"];
    
    
  /**
    2.CAKeyframeAnimation(关键帧动画)
    CABaseAnimation只能从一个数值（fromValue）变换成另一个数值（toValue）,而CAKeyframeAnimation则会使用一个NSArray保存一组关键帧。
    values ： 就是上述的NSArray对象。里面的元素称为”关键帧”(keyframe)。动画对象会在指定的时间(duration)内，依次显示values数组中的每一个关键帧
    path ： 可以设置一个CGPathRef\CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用。如果你设置了path，那么values将被忽略。
    keyTimes ： 可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧.当keyTimes没有设置的时候,各个关键帧的时间是平分的。
    **/
    UIView *demo2 = [UIView new];
    demo2.backgroundColor = [UIColor greenColor];
    demo2.frame = CGRectMake(200, 100, 100, 100);
    [self.view addSubview:demo2];
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 100, 200)];
    animation2.path = path.CGPath;
    animation2.duration = 3.;
    [demo2.layer addAnimation:animation2 forKey:@"demo2Position"];
    
    /**
    3.CAAnimationGroup(组动画)
    CAAnimation的子类，可以保存一组动画对象，将CAAnimationGroup对象加入层后，组中所有动画对象可以同时并发运行。
    重要属性
    animations : 用来保存一组动画对象的NSArray
    **/
    UIView *demo3 = [UIView new];
    demo3.backgroundColor = [UIColor lightGrayColor];
    demo3.frame = CGRectMake(0, 200, 100, 100);
    [self.view addSubview:demo3];
    
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *va0 = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    NSValue *va1 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *va2 = [NSValue valueWithCGPoint:CGPointMake(250, 320)];
    NSValue *va3 = [NSValue valueWithCGPoint:CGPointMake(200, 500)];
    ani.values = [NSArray arrayWithObjects:va0,va1,va2,va3, nil];
    
    //缩放动画
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ani2.fromValue = [NSNumber numberWithFloat:0.8f];
    ani2.toValue = [NSNumber numberWithFloat:2.0f];
    
    //旋转动画
    CABasicAnimation *ani3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    ani3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
//    组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:ani,ani2,ani3, nil];
    group.duration = 6;
    [demo3.layer addAnimation:group forKey:@"demo3Group"];
    
    AnimationView *animationV = [[AnimationView alloc] initWithFrame:CGRectMake(0, 500, 300, 150)];
    [self.view addSubview:animationV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
