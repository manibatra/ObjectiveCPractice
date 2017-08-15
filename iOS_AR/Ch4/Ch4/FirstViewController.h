//
//  FirstViewController.h
//  Ch4
//
//  Created by Mani Batra on 21/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface FirstViewController : UIViewController<UIAccelerometerDelegate>{
    
    CMMotionManager *motionManager;
    
    UIAccelerometer *accelerometer;
    
    UILabel *xLabel;
    UILabel *yLabel;
    UILabel *zLabel;
    
    UIProgressView *xProgressView;
    UIProgressView *yProgressView;
    UIProgressView *zProgressView;

    
    
    
}

@property(nonatomic, strong) CMMotionManager *motionManager;

@property(nonatomic, retain) UIAccelerometer *accelerometer;

@property(nonatomic, retain) IBOutlet UILabel *xLabel;
@property(nonatomic, retain) IBOutlet UILabel *yLabel;
@property(nonatomic, retain) IBOutlet UILabel *zLabel;

@property(nonatomic, retain) IBOutlet UIProgressView *xProgressView;
@property(nonatomic, retain) IBOutlet UIProgressView *yProgressView;
@property(nonatomic, retain) IBOutlet UIProgressView *zProgressView;

@end
