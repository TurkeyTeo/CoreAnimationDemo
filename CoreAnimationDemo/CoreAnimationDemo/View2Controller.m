//
//  View2Controller.m
//  CoreAnimationDemo
//
//  Created by Thinkive on 2017/9/26.
//  Copyright © 2017年 Teo. All rights reserved.
//

#import "View2Controller.h"
#import "ShowAnimationV.h"

@interface View2Controller ()

@end

@implementation View2Controller

- (void)viewDidLoad {
    [super viewDidLoad];

    ShowAnimationV *view = [ShowAnimationV new];
    view.frame = self.view.bounds;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
