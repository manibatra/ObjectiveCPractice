//
//  SecondViewController.h
//  Sensors
//
//  Created by Mani Batra on 07/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface SecondViewController : UIViewController

@property (nonatomic, retain) CMMotionManager *motionManager;
@property(nonatomic, retain) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *rollLabel;
@property (weak, nonatomic) IBOutlet UILabel *pitchLabel;
@property (weak, nonatomic) IBOutlet UILabel *yawLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIProgressView *rollProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *pitchProgressView;

@property (weak, nonatomic) IBOutlet UIProgressView *yawProgressView;

-(IBAction)readGyroscope;
@end
