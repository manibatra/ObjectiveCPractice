//
//  SecondViewController.m
//  Sensors
//
//  Created by Mani Batra on 07/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize motionManager;
@synthesize rollLabel, pitchLabel, yawLabel, rollProgressView, pitchProgressView, yawProgressView, imageView, timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.motionManager=[[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval=1.0/60.0;
    if (motionManager.isDeviceMotionAvailable){
        
        [motionManager startDeviceMotionUpdates];
        [motionManager startGyroUpdates];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) readGyroscope{
    
    CMDeviceMotion *currentDeviceMotion= motionManager.deviceMotion;
    CMAttitude *currentAttitude=currentDeviceMotion.attitude;
    NSLog(@"Attitued : %@", currentAttitude);
    
    rollLabel.text=[NSString stringWithFormat:@"%f", currentAttitude.roll];
    rollProgressView.progress=ABS(currentAttitude.roll);
    pitchLabel.text=[NSString stringWithFormat:@"%f", currentAttitude.pitch];
    pitchProgressView.progress=ABS(currentAttitude.pitch);
    yawLabel.text=[NSString stringWithFormat:@"%f", currentAttitude.yaw];
    yawProgressView.progress=ABS(currentAttitude.yaw);
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(doGyroUpdate) userInfo:nil repeats:YES];


}


-(void) doGyroUpdate{

    float rotation;
    float rate=motionManager.gyroData.rotationRate.z;
    if (fabs(rate) > .2) {
        
        float direction= rate > 0 ? 1:-1;
        rotation += direction*M_PI/90.0;
        imageView.transform= CGAffineTransformMakeRotation(rotation*10);
        NSLog(@"Rotation : %f", rotation);
        
    }

    

    
    
}

@end
