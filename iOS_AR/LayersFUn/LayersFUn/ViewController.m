//
//  ViewController.m
//  LayersFUn
//
//  Created by Mani Batra on 25/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.layer.backgroundColor=[UIColor orangeColor].CGColor;
    self.view.layer.cornerRadius=20;
    self.view.layer.frame=CGRectInset(self.view.layer.frame, 20, 20);
    
    CALayer *subLayer=[CALayer layer];
    subLayer.shadowOffset=CGSizeMake(0, 3);
    subLayer.backgroundColor=[UIColor blueColor].CGColor;
    subLayer.shadowRadius=5.0;
    subLayer.shadowColor=[UIColor blackColor].CGColor;
    subLayer.shadowOpacity=0.8;
    subLayer.frame=CGRectMake(30, 30, 128, 192);
    subLayer.borderColor=[UIColor blackColor].CGColor;
    subLayer.borderWidth=2.0;
    subLayer.cornerRadius=10.0;
    [self.view.layer addSublayer:subLayer];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = subLayer.bounds;
    imageLayer.cornerRadius = 10.0;
    imageLayer.contents = (id) [UIImage imageNamed:@"BattleMapSplashScreen.jpg"].CGImage;
    imageLayer.masksToBounds = YES;
    [subLayer addSublayer:imageLayer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
