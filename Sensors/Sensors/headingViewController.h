//
//  headingViewController.h
//  Sensors
//
//  Created by Mani Batra on 18/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface headingViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *compassImage;
@property (weak, nonatomic) IBOutlet UILabel *trueHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *magneticHeadingLabel;
@property (nonatomic, retain) CLLocationManager *locationManager;

-(float)heading:(float)heading fromOrientation:(UIDeviceOrientation) orientation;
-(NSString*)stringFromOrientation:(UIDeviceOrientation) orientation;

@end
