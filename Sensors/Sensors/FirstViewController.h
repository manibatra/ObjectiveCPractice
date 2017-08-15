//
//  FirstViewController.h
//  Sensors
//
//  Created by Mani Batra on 07/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIAccelerometerDelegate>{
    
    UIAccelerometer *accelometer;
    

}

@property (nonatomic, retain) UIAccelerometer *accelometer;
@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *zLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *xProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *yProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *zProgressView;

@end
