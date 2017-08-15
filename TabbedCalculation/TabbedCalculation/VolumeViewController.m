//
//  VolumeViewController.m
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define Pi 3.145926
#import "VolumeViewController.h"

@interface VolumeViewController ()

@end

@implementation VolumeViewController
@synthesize boxWidth;
@synthesize boxHeight;
@synthesize boxLength;
@synthesize boxResult;
@synthesize sphereRadius;
@synthesize sphereResult;

-(IBAction)calculate:(id)sender{
    
    float floatBoxResult=[boxHeight.text floatValue]*[boxLength.text floatValue]*[boxWidth.text floatValue];
    float floatSphereResult=(4/3)*Pi*[sphereRadius.text floatValue]*[sphereRadius.text floatValue]*[sphereRadius.text floatValue];
    
    NSString *stringBoxResult=[[NSString alloc] initWithFormat:@"%1.2f",floatBoxResult];
    NSString *stringSphereResult=[[NSString alloc] initWithFormat:@"%1.2f",floatSphereResult];
    boxResult.text=stringBoxResult;
    sphereResult.text=stringSphereResult;
    [stringBoxResult release];
    [stringSphereResult release];
    
    [summaryViewController updateTotal];

    
    
}
-(IBAction)hideKeyboard:(id)sender{
    
    [boxLength resignFirstResponder];
    [boxHeight resignFirstResponder];
    [boxWidth resignFirstResponder];
    [sphereRadius resignFirstResponder];

    
    
}


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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
