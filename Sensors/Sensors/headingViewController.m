//
//  headingViewController.m
//  Sensors
//
//  Created by Mani Batra on 18/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "headingViewController.h"

@interface headingViewController ()

@end

@implementation headingViewController
@synthesize  compassImage, magneticHeadingLabel, trueHeadingLabel, locationManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    locationManager=[[CLLocationManager alloc] init];
    locationManager.delegate=self;
    //locationManager.headingFilter=5;
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager headingAvailable]) {
        
        NSLog(@"Here");
        [locationManager startUpdatingHeading];
        [locationManager startUpdatingLocation];
        
        
    }else{
        
        NSLog(@"Error starting location updates");
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    NSLog(@"here2");
    if (newHeading.headingAccuracy > 0) {
        
        
        UIDevice *device=[UIDevice currentDevice];
        NSLog(@"%@", [self stringFromOrientation:device.orientation]);
        float magneticHeading=[self heading:newHeading.magneticHeading fromOrientation:device.orientation];
        float trueHeading = [self heading:newHeading.trueHeading fromOrientation:device.orientation];
        
        
        magneticHeadingLabel.text=[NSString stringWithFormat:@"%f", magneticHeading];
        trueHeadingLabel.text=[NSString stringWithFormat:@"%f", trueHeading];
        
        float heading= -1.0f*M_PI*newHeading.magneticHeading/180.0f;
        
        compassImage.transform=CGAffineTransformMakeRotation(heading);
        
        
    }
    
    
    
    
}


-(float)heading:(float)heading fromOrientation:(UIDeviceOrientation) orientation{
    
    
    float correctedHeading=heading;
    
    switch(orientation){
            
            case UIDeviceOrientationPortrait:
            break;
            
            
            case UIDeviceOrientationPortraitUpsideDown:
            correctedHeading=heading+180.0f;
            break;
            
            
            case UIDeviceOrientationLandscapeLeft:
            correctedHeading=heading+90.0f;
            break;
            
            
        case UIDeviceOrientationLandscapeRight:
            correctedHeading=heading-90.0f;
            break;
            
        default:
            break;
            
            
            
            
    }
    
    
    while (correctedHeading>360.0f) {
        correctedHeading=correctedHeading-360;
    }
    
    
    return correctedHeading;
    
}
-(NSString*)stringFromOrientation:(UIDeviceOrientation) orientation{
    
    
    NSString *orientationString;
    
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            orientationString=@"Potrait";
            break;
            
            
        case UIDeviceOrientationPortraitUpsideDown:
            orientationString=@"Portrait UpsideDown";
            break;
            
            
        case UIDeviceOrientationLandscapeLeft:
            orientationString=@"Landscape Left";

            break;
            
            
        case UIDeviceOrientationFaceDown:
            orientationString=@"Face Down";
            break;
            
        
        case UIDeviceOrientationFaceUp:
            orientationString=@"Face Up";
            break;
            
        case UIDeviceOrientationUnknown:
            orientationString=@"Unknown";
            break;
            
            

            
            

            
            
            
        default:
            orientationString=@"Not Known";
            break;
    }
    
    
    return orientationString;
    
}


@end
