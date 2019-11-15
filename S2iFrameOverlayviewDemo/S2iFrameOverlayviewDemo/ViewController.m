//
//  ViewController.m
//  S2iFrameOverlayviewDemo
//
//  Created by simon on 2019/11/15.
//  Copyright © 2019 x.dong. All rights reserved.
//

#import "ViewController.h"
#import "S2iFrameOverlayView.h"
@interface ViewController ()
{
    S2iFrameOverlayView *overlayView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    overlayView = [[S2iFrameOverlayView alloc]initWithCol:10 andRow:10 lineColor:@"123456ff" lineWidth:1 Frame:CGRectMake(20, 100, self.view.frame.size.width-40,self.view.frame.size.width-40)];
    
    
    [self.view addSubview:overlayView];
    // Do any additional setup after loading the view.
}


@end
