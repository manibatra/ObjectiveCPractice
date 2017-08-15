//
//  FirstViewController.m
//  Ch4
//
//  Created by Mani Batra on 21/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize accelerometer, xLabel, yLabel, zLabel, xProgressView, yProgressView, zProgressView, motionManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [self startAccelerometerUpdates];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startAccelerometerUpdates{
    
    NSLog(@"here");
    self.motionManager=[[CMMotionManager alloc] init];
    
    self.motionManager.accelerometerUpdateInterval=0.2;
     
    
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
    
    [self.motionManager startAccelerometerUpdates];
    
    if (motionManager.deviceMotion) {
        
        NSLog(@"%f",motionManager.deviceMotion.userAcceleration.x);
        
    }
                                                                                                                
                                                                
    
    
    
    
}

@end
