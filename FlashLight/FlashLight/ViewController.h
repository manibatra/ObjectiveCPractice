//
//  ViewController.h
//  FlashLight
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOnOffToggle @"onOff"
#define kBrightnessLevel @"brightness"

@interface ViewController : UIViewController{
    
    IBOutlet UIView *lightSource;
    IBOutlet UISwitch *toggleSwitch;
    IBOutlet UISlider *brightnessSlider;
    
    
}

@property (nonatomic, retain) UIView *lightSource;
@property (nonatomic, retain) UISwitch *toggleSwitch;
@property (nonatomic, retain) UISlider *brightnessSlider;

-(IBAction)setLightSourceAlphaValue:(id)sender;

@end
