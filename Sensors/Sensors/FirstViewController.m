//
//  FirstViewController.m
//  Sensors
//
//  Created by Mani Batra on 07/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize xLabel, yLabel, zLabel;
@synthesize xProgressView, yProgressView, zProgressView;
@synthesize accelometer;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    accelometer=[UIAccelerometer sharedAccelerometer];
    accelometer.updateInterval=0.5;
    accelometer.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    xLabel.text=[NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
    yLabel.text=[NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
    zLabel.text=[NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
    
    xProgressView.progress=ABS(acceleration.x);
    
    yProgressView.progress=ABS(acceleration.y);
    
    zProgressView.progress=ABS(acceleration.z);
    
    double const kThreshold=2.0;
    if( ABS(acceleration.x) > kThreshold
       || ABS(acceleration.y)>kThreshold
       || ABS(acceleration.z)>kThreshold){
        
        NSLog(@"Shake detected");
        
    }
    


    
}

@end
