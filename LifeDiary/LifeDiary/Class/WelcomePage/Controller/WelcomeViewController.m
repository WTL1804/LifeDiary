//
//  WelcomeViewController.m
//  LifeDiary
//
//  Created by 王天亮 on 2019/12/15.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "WelcomeViewController.h"
#import "WelComeView.h"
@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _welComeView = [[WelComeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_welComeView];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeTask) userInfo:nil repeats:YES];
    self.number = 0;
   
    [_welComeView setUI];
}
- (void)timeTask {
    
    self.number = self.number +1;
    if (self.number == 2) {
        [self.timer invalidate];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
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
