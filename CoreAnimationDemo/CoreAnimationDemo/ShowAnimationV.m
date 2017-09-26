//
//  ShowAnimationV.m
//  CoreAnimationDemo
//
//  Created by Thinkive on 2017/9/26.
//  Copyright © 2017年 Teo. All rights reserved.
//

#import "ShowAnimationV.h"

#define TTAngle(x) ((x) / 180.0f * M_PI)
#define TTFrame(x) ((x) * 0.04)
#define kscaleDeviceLength(x) x

@protocol TTAnimationWeakDelegate<NSObject>

@optional
- (void)animationDidStart:(CAAnimation *)anim;
- (void)animationDidStop:(CAAnimation *)anim;
@end

//添加代理管理者, 通过自定义代理方法可以解决内存泄露问题
@interface TTAnimationDelegateManager:NSObject<CAAnimationDelegate>

@property (nonatomic, weak) id<TTAnimationWeakDelegate>delegate;

@end

@implementation TTAnimationDelegateManager

- (void)animationDidStart:(CAAnimation *)anim{
    if (_delegate && [_delegate respondsToSelector:@selector(animationDidStart:)]) {
        [_delegate animationDidStart:anim];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (_delegate && [_delegate respondsToSelector:@selector(animationDidStop:)]) {
        [_delegate animationDidStop:anim];
    }
}


@end

@interface ShowAnimationV()<TTAnimationWeakDelegate>

@property (nonatomic,strong) UIImageView * backgroundView;
@property (nonatomic,strong) UIImageView * phoneView;
@property (nonatomic,strong) CALayer * maskLayer;
@property (nonatomic,strong) CALayer * phoneLayer;
@property (nonatomic,strong) UIImageView * handView;
@property (nonatomic,strong) UIImageView * homeView;
@property (nonatomic,strong) UIImageView * topIcon;
@property (nonatomic,strong) UIImageView * leftIcon;
@property (nonatomic,strong) UIImageView * bottomIcon;
@property (nonatomic,strong) UIImageView * rightIcon;
@property (nonatomic,strong) UIImageView * coverView;
@property (nonatomic,strong) UIImageView * charView1;
@property (nonatomic,strong) UIImageView * charView2;
@property (nonatomic,strong) UIImageView * lineView1;
@property (nonatomic,strong) UIImageView * lineView2;

@end

@implementation ShowAnimationV

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (UIImageView *)backgroundView {
    
    if (!_backgroundView) {
        _backgroundView = [UIImageView new];
        _backgroundView.image = [UIImage imageNamed:@"1"];
        _backgroundView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    }
    return _backgroundView;
}

- (UIImageView *)phoneView {
    
    if (!_phoneView) {
        _phoneView = [UIImageView new];
        _phoneView.layer.mask = self.maskLayer;
    }
    return _phoneView;
}

- (CALayer *)phoneLayer {
    
    if (!_phoneLayer) {
        _phoneLayer = [CALayer new];
        _phoneLayer.contents = (__bridge id)[UIImage imageNamed:@"2"].CGImage;
    }
    return _phoneLayer;
}

- (CALayer *)maskLayer {
    
    if (!_maskLayer) {
        _maskLayer = [CALayer new];
        _maskLayer.contents = (__bridge id)[UIImage imageNamed:@"3"].CGImage;
    }
    return _maskLayer;
}

- (UIImageView *)handView {
    
    if (!_handView) {
        _handView = [UIImageView new];
        _handView.image = [UIImage imageNamed:@"4"];
        _handView.layer.anchorPoint = CGPointZero;
        _handView.layer.opacity = 0;
    }
    return _handView;
}

- (UIImageView *)homeView {
    
    if (!_homeView) {
        _homeView = [UIImageView new];
        _homeView.image = [UIImage imageNamed:@"5"];
        _homeView.layer.opacity = 0;
    }
    return _homeView;
}

- (UIImageView *)topIcon {
    
    if (!_topIcon) {
        _topIcon = [UIImageView new];
        _topIcon.image = [UIImage imageNamed:@"6"];
        _topIcon.transform = CGAffineTransformMakeScale(0, 0);
    }
    return _topIcon;
}

- (UIImageView *)leftIcon {
    
    if (!_leftIcon) {
        _leftIcon = [UIImageView new];
        _leftIcon.image = [UIImage imageNamed:@"7"];
        _leftIcon.transform = CGAffineTransformMakeScale(0, 0);
    }
    return _leftIcon;
}

- (UIImageView *)bottomIcon {
    
    if (!_bottomIcon) {
        _bottomIcon = [UIImageView new];
        _bottomIcon.image = [UIImage imageNamed:@"6"];
        _bottomIcon.transform = CGAffineTransformMakeScale(0, 0);
    }
    return _bottomIcon;
}

- (UIImageView *)rightIcon {
    
    if (!_rightIcon) {
        _rightIcon = [UIImageView new];
        _rightIcon.image = [UIImage imageNamed:@"5"];
        _rightIcon.transform = CGAffineTransformMakeScale(0, 0);
    }
    return _rightIcon;
}

- (UIImageView *)coverView {
    
    if (!_coverView) {
        _coverView = [UIImageView new];
        _coverView.image = [UIImage imageNamed:@"1"];
        _coverView.layer.opacity = 0;
    }
    return _coverView;
}

- (UIImageView *)charView1 {
    
    if (!_charView1) {
        _charView1 = [UIImageView new];
        _charView1.image = [UIImage imageNamed:@"3"];
        _charView1.layer.opacity = 0;
    }
    return _charView1;
}

- (UIImageView *)charView2 {
    
    if (!_charView2) {
        _charView2 = [UIImageView new];
        _charView2.image = [UIImage imageNamed:@"1"];
        _charView2.layer.opacity = 0;
    }
    return _charView2;
}

- (UIImageView *)lineView1 {
    
    if (!_lineView1) {
        _lineView1 = [UIImageView new];
        _lineView1.image = [UIImage imageNamed:@"5"];
    }
    return _lineView1;
}

- (UIImageView *)lineView2 {
    
    if (!_lineView2) {
        _lineView2 = [UIImageView new];
        _lineView2.image = [UIImage imageNamed:@"7"];
    }
    return _lineView2;
}

- (void)setupSubviews {
    [self addSubview:self.backgroundView];
    [self addSubview:self.coverView];
    [self.backgroundView addSubview:self.phoneView];
    [self.phoneView.layer addSublayer:self.phoneLayer];
    [self addSubview:self.handView];
    [self addSubview:self.homeView];
    [self addSubview:self.topIcon];
    [self addSubview:self.leftIcon];
    [self addSubview:self.bottomIcon];
    [self addSubview:self.rightIcon];
    [self addSubview:self.charView1];
    [self addSubview:self.charView2];
    [self addSubview:self.lineView1];
    [self addSubview:self.lineView2];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [btn addTarget:self action:@selector(loadAnimations) forControlEvents:64];
    [self addSubview:btn];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width * 0.75;
    CGFloat height = width * 1.10704961;
    CGFloat length = width * 0.82114883;
    
    _backgroundView.bounds = CGRectMake(0, 0, width, height);
    _backgroundView.center = (CGPoint){self.center.x, self.center.y - 20};
    
    CGFloat coverViewW = width * 1.06396867;
    CGFloat coverViewH = coverViewW * 1.00736196;
    _coverView.bounds = CGRectMake(0, 0, coverViewW, coverViewH);
    _coverView.center = _backgroundView.center;
    
    CGFloat phoneViewW = length * 0.68203498;
    CGFloat phoneViewH = phoneViewW * 1.44988345;
    CGFloat phoneViewX = (width - phoneViewW) * 0.5;
    CGFloat phoneViewY = (height - phoneViewH) * 0.5;
    _phoneView.frame = CGRectMake(phoneViewX, phoneViewY, phoneViewW, phoneViewH);
    
    CGFloat phoneLayerX = 0;
    CGFloat phoneLayerY = phoneViewH;
    CGFloat phoneLayerW = phoneViewW;
    CGFloat phoneLayerH = phoneViewH;
    _phoneLayer.frame = CGRectMake(phoneLayerX, phoneLayerY, phoneLayerW, phoneLayerH);
    
    CGFloat maskLayerW = length;
    CGFloat maskLayerH = length;
    CGFloat maskLayerX = (phoneViewW - maskLayerW) * 0.5;
    CGFloat maskLayerY = (phoneViewH - maskLayerH) * 0.5;
    _maskLayer.frame = CGRectMake(maskLayerX, maskLayerY, maskLayerW, maskLayerH);
    
    CGFloat handViewX = _backgroundView.center.x + kscaleDeviceLength(50);
    CGFloat handViewY = _backgroundView.center.y + kscaleDeviceLength(60);
    CGFloat handViewW = width * 0.56396867;
    CGFloat handViewH = handViewW * 0.98611111;
    _handView.frame = CGRectMake(handViewX, handViewY, handViewW, handViewH);
    
    CGFloat homeViewW = width * 0.27154047;
    CGFloat homeViewH = homeViewW * 1.02884615;
    CGFloat homeViewX = _backgroundView.center.x - homeViewW * 0.5;
    CGFloat homeViewY = _backgroundView.center.y - homeViewH * 0.5 + kscaleDeviceLength(15);
    _homeView.frame = CGRectMake(homeViewX, homeViewY, homeViewW, homeViewH);
    
    CGFloat topIconW = width * 0.32375979;
    CGFloat topIconH = topIconW;
    _topIcon.bounds = CGRectMake(0, 0, topIconW, topIconH);
    _topIcon.center = CGPointMake(kscaleDeviceLength(200), kscaleDeviceLength(130));
    
    CGFloat leftIconW = width * 0.28720627;
    CGFloat leftIconH = leftIconW;
    _leftIcon.bounds = CGRectMake(0, 0, leftIconW, leftIconH);
    _leftIcon.center = CGPointMake(kscaleDeviceLength(40), kscaleDeviceLength(200));
    
    CGFloat bottomIconW = width * 0.30417755;
    CGFloat bottomIconH = bottomIconW;
    _bottomIcon.bounds = CGRectMake(0, 0, bottomIconW, bottomIconH);
    _bottomIcon.center = CGPointMake(kscaleDeviceLength(50), kscaleDeviceLength(360));
    
    CGFloat rightIconW = width * 0.25195822;
    CGFloat rightIconH = rightIconW;
    _rightIcon.bounds = CGRectMake(0, 0, rightIconW, rightIconH);
    _rightIcon.center = CGPointMake(kscaleDeviceLength(260), kscaleDeviceLength(260));
    
    CGFloat charView2W = width * 0.94386423;
    CGFloat charView2H = charView2W * 0.07745505;
    CGFloat charView2X = (self.frame.size.width - charView2W) * 0.5;
    CGFloat charView2Y = self.frame.size.height - charView2H - kscaleDeviceLength(50);
    _charView2.frame = CGRectMake(charView2X, charView2Y, charView2W, charView2H);
    
    CGFloat charView1W = width * 0.4308094;
    CGFloat charView1H = charView1W * 0.23939394;
    CGFloat charView1X = (self.frame.size.width - charView1W) * 0.5;
    CGFloat charView1Y = charView2Y - charView1H - kscaleDeviceLength(15);
    _charView1.frame = CGRectMake(charView1X, charView1Y, charView1W, charView1H);
    
    CGFloat lineView1X = kscaleDeviceLength(238.5);
    CGFloat lineView1Y = kscaleDeviceLength(131);
    CGFloat lineView1W = width * 0.07832898;
    CGFloat lineView1H = lineView1W;
    _lineView1.frame = CGRectMake(lineView1X, lineView1Y, lineView1W, lineView1H);
    
    CGFloat lineView2X = kscaleDeviceLength(80);
    CGFloat lineView2Y = kscaleDeviceLength(400);
    CGFloat lineView2W = lineView1W;
    CGFloat lineView2H = lineView1W;
    _lineView2.frame = CGRectMake(lineView2X, lineView2Y, lineView2W, lineView2H);
}

- (void)loadAnimations{
    CAKeyframeAnimation * backgroundViewAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    backgroundViewAnim.values = @[@0.3, @1.2, @1.0];
    backgroundViewAnim.keyTimes = @[@0, @0.6, @1.0];
    backgroundViewAnim.fillMode = kCAFillModeForwards;
    backgroundViewAnim.removedOnCompletion = NO;
    backgroundViewAnim.duration = TTFrame(6);
    TTAnimationDelegateManager * manager = [TTAnimationDelegateManager new];
    manager.delegate = self;
    backgroundViewAnim.delegate = manager;
    [_backgroundView.layer addAnimation:backgroundViewAnim forKey:@"animation1"];
    
    CABasicAnimation * lineViewAnim = [self scaleAnimation];
    lineViewAnim.duration = TTFrame(6);
    [_lineView1.layer addAnimation:lineViewAnim forKey:nil];
    [_lineView2.layer addAnimation:lineViewAnim forKey:nil];
}


- (void)animationDidStop:(CAAnimation *)anim {
    
    if ([_backgroundView.layer animationForKey:@"animation1"] == anim) {
        
        CABasicAnimation * phoneLayerAnim = [CABasicAnimation animationWithKeyPath:@"position.y"];
        phoneLayerAnim.fromValue = @(_phoneView.bounds.size.height + kscaleDeviceLength(180));
        phoneLayerAnim.toValue = @(_phoneView.bounds.size.height - kscaleDeviceLength(70));
        phoneLayerAnim.fillMode = kCAFillModeForwards;
        phoneLayerAnim.removedOnCompletion = NO;
        phoneLayerAnim.duration = TTFrame(10);
        TTAnimationDelegateManager * manager = [TTAnimationDelegateManager new];
        manager.delegate = self;
        phoneLayerAnim.delegate = manager;
        [_phoneLayer addAnimation:phoneLayerAnim forKey:@"animation2"];
    }
    
    if ([_phoneLayer animationForKey:@"animation2"] == anim) {
        
        CABasicAnimation * translation = [CABasicAnimation animationWithKeyPath:@"position"];
        translation.fromValue = [NSValue valueWithCGPoint:CGPointMake(_backgroundView.center.x + kscaleDeviceLength(50), _backgroundView.center.y + kscaleDeviceLength(60))];
        translation.toValue = [NSValue valueWithCGPoint:CGPointMake(_backgroundView.center.x, _backgroundView.center.y + kscaleDeviceLength(30))];
        
        CAAnimationGroup * group = [CAAnimationGroup animation];
        group.fillMode = kCAFillModeForwards;
        group.removedOnCompletion = NO;
        group.duration = TTFrame(19);
        group.animations = @[translation, [self opacityAnimation]];
        TTAnimationDelegateManager * manager = [TTAnimationDelegateManager new];
        manager.delegate = self;
        group.delegate = manager;
        [_handView.layer addAnimation:group forKey:@"animation3"];
    }
    
    if ([_handView.layer animationForKey:@"animation3"] == anim) {
        
        CABasicAnimation * animation = [self opacityAnimation];
        animation.duration = TTFrame(5);
        [_homeView.layer addAnimation:animation forKey:nil];
        
        [_topIcon.layer addAnimation:[self groupAnimation:[self translationWithIcon:_topIcon]] forKey:@"animation4"];
        [_rightIcon.layer addAnimation:[self groupAnimation:[self translationWithIcon:_rightIcon]] forKey:nil];
        [_bottomIcon.layer addAnimation:[self groupAnimation:[self translationWithIcon:_bottomIcon]] forKey:nil];
        [_leftIcon.layer addAnimation:[self groupAnimation:[self translationWithIcon:_leftIcon]] forKey:nil];
    }
    
    if ([_topIcon.layer animationForKey:@"animation4"] == anim) {
        
        [_topIcon.layer addAnimation:[self rotateWithIcon:_topIcon clockwise:YES] forKey:nil];
        [_rightIcon.layer addAnimation:[self rotateWithIcon:_rightIcon clockwise:NO] forKey:nil];
        [_bottomIcon.layer addAnimation:[self rotateWithIcon:_bottomIcon clockwise:YES] forKey:nil];
        [_leftIcon.layer addAnimation:[self rotateWithIcon:_leftIcon clockwise:NO] forKey:nil];
        
        CABasicAnimation * opacity = [self opacityAnimation];
        opacity.duration = TTFrame(5);
        
        CABasicAnimation * opacity2 = [self opacityAnimation];
        opacity2.beginTime = TTFrame(5);
        opacity2.duration = TTFrame(5);
        
        CABasicAnimation * charView1Anim = [self translationWithText:_charView1];
        charView1Anim.duration = TTFrame(10);
        
        CABasicAnimation * charView2Anim = [self translationWithText:_charView2];
        charView2Anim.beginTime = TTFrame(5);
        charView2Anim.duration = TTFrame(10);
        
        CAAnimationGroup * group = [CAAnimationGroup animation];
        group.fillMode = kCAFillModeForwards;
        group.removedOnCompletion = NO;
        group.duration = TTFrame(15);
        group.animations = @[opacity, charView1Anim];
        
        CAAnimationGroup * group2 = [CAAnimationGroup animation];
        group2.fillMode = kCAFillModeForwards;
        group2.removedOnCompletion = NO;
        group2.duration = TTFrame(15);
        group2.animations = @[opacity2, charView2Anim];
        
        [_charView1.layer addAnimation:group forKey:nil];
        [_charView2.layer addAnimation:group2 forKey:nil];
        
        CABasicAnimation * translation = [CABasicAnimation animationWithKeyPath:@"position"];
        translation.fromValue = [NSValue valueWithCGPoint:CGPointMake(_coverView.center.x - kscaleDeviceLength(50), _coverView.center.y + kscaleDeviceLength(50))];
        translation.toValue = [NSValue valueWithCGPoint:_coverView.center];
        translation.duration = TTFrame(10);
        
        CAAnimationGroup * group3 = [CAAnimationGroup animation];
        group3.fillMode = kCAFillModeForwards;
        group3.removedOnCompletion = NO;
        group3.duration = TTFrame(10);
        group3.animations = @[opacity, translation];
        [_coverView.layer addAnimation:group3 forKey:nil];
    }
}

- (CABasicAnimation *)translationWithText:(UIView *)text {
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.fromValue = @(text.center.y + kscaleDeviceLength(50));
    animation.toValue = @(text.center.y);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    return animation;
}


- (CABasicAnimation *)translationWithIcon:(UIView *)icon {
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(_homeView.frame), CGRectGetMaxY(_homeView.frame))];
    animation.toValue = [NSValue valueWithCGPoint:icon.center];
    return  animation;
}

- (CAKeyframeAnimation *)rotateWithIcon:(UIView *)icon clockwise:(BOOL)clockwise  {
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(icon.center.x, icon.center.y) radius:(arc4random()%5) + 1 startAngle:TTAngle(0) endAngle:TTAngle(360) clockwise:clockwise];
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    animation.path = path.CGPath;
    animation.repeatCount = MAXFLOAT;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    return animation;
}

- (CAAnimationGroup *)groupAnimation:(CABasicAnimation *)animation {
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.duration = TTFrame(10);
    TTAnimationDelegateManager * manager = [TTAnimationDelegateManager new];
    manager.delegate = self;
    group.delegate = manager;
    group.animations = @[[self opacityAnimation], animation, [self scaleAnimation]];
    return group;
}

- (CABasicAnimation *)opacityAnimation {
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    return animation;
}

- (CABasicAnimation *)scaleAnimation {
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    return animation;
}






@end
