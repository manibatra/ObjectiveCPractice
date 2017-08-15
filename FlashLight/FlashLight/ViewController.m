//
//  ViewController.m
//  FlashLight
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lightSource;
@synthesize toggleSwitch;
@synthesize brightnessSlider;

-(IBAction)setLightSourceAlphaValue:(id)sender{
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setBool:toggleSwitch.on forKey:kOnOffToggle];
    [userDefaults setFloat:lightSource.alpha forKey:kBrightnessLevel];
    [userDefaults synchronize];
    
    if (toggleSwitch.on) {
        lightSource.alpha=brightnessSlider.value;
            } else {
                lightSource.alpha=0;
                    }
    
}

- (void)viewDidLoad
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    toggleSwitch.on=[userDefaults boolForKey:kOnOffToggle];
    lightSource.alpha=[userDefaults floatForKey:kBrightnessLevel];
    if ([userDefaults boolForKey:kOnOffToggle]) {
        lightSource.alpha=[userDefaults floatForKey:kBrightnessLevel];
            } else {
                lightSource.alpha=0.0;
                    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(void) dealloc{
    
    [lightSource dealloc];
    [toggleSwitch dealloc];
    [brightnessSlider dealloc];
    [super dealloc];
    
}

@end
